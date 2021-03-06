var RestOAuthModel = require('./oAuthModel.js').RestOAuthModel;
var util = require("util");
var log = require('czagenda-log').from(__filename);
var models = require('../../models');
var async = require('async');
var statusCodes = require('../statusCodes');
var mModelSearch = require('./mModelSearch');

var Membership = require('../../models/membership.js').Membership;
var async = require('async');

var RestGroup = exports.RestGroup = function (server) {
	
	RestOAuthModel.call(this, 'group', models.Group, server);
	
	this._urls.get[this._urlPrefix + '/:id/users'] = {fn :  this.memberships};
	this._urls.get[this._urlPrefix + '/:id/perms/wu'] = {fn :  this.permsUserWrite};
	this._urls.get[this._urlPrefix + '/:id/perms/wg'] = {fn :  this.permsGroupWrite};
	
	this._urls.get[this._urlPrefix + '/_search'] = {
		fn : this.search
	};

	this._urls.post[this._urlPrefix + '/_search'] = {
		fn : this.search
	};
	
	this._initServer();
}
util.inherits(RestGroup, RestOAuthModel);


for(k in mModelSearch) {
	RestGroup.prototype[k] = mModelSearch[k];
}

RestGroup.prototype.searchFields = {
	'createDate' : 'datetime',
	'updateDate' : 'datetime',
	'title' : 'text',
	'description' : 'text'
}

RestGroup.prototype.sortFields = {
	'createDate' : 'createDate',
	'updateDate' : 'updateDate',
	'title' : 'title.untouched'	
}

RestGroup.prototype.fulltextFields = ['title', 'description'];

RestGroup.prototype._preCreate = function(obj, req, callback) {
	
	// create write permission
	var p = new models.perms.GroupWriteUser();
	p.applyOn = obj.getId();
	p.grantTo = req.user.id;
	p.setValidationDone();
	
	// add write permission to obj
	obj.computedWriteUsers.push(req.user.id);
	obj.computedWriteUsersPerms.push(p.getId());
	
	p.save(function(err, p) {
		
		if (err === null) {
			req.preCreateObjects = [p];
		}
		
		// trivial but it's what we want...
		if( err instanceof models.errors.ObjectAlreadyExists) {
			err = null;
		}

		if(err !== null) {
			log.warning('RestAgenda.prototype.create: unable to create permission GroupWriteUser on ', req.user.id, obj.getId(), err)
			callback(new models.errors.InternalError('Unable to create permission, aborting'));
		} else {
			callback(null);
		}
		
	}, false, false)
}

RestGroup.prototype._postCreate = function(err, obj, req, callback) {

	if (err === null || typeof(req.preCreateObjects) === 'undefined') {
		callback();
		return;
	}

	// rolling back
	var rollbackMethods = [];
	req.preCreateObjects.forEach(function(toDelObj) {
		rollbackMethods.push(function(callback) {
			toDelObj.del(function(err, obj) {
				
				if (err !== null) {
					log.warning('RestGroup.prototype._postCreate: rolling back failed', toDelObj.id)
				}
				
				callback(err);
			}, false);
		});
	});

	async.parallel(rollbackMethods, function(rollbackErr) {
		callback();
	});
}

RestGroup.prototype._preDel = function(obj, req, callback) {

	var id = "/group/" + req.params.id;

	var query = {
		
		"query" : {
			"filtered" : {
				"query" : {
					"match_all" : {}
				},
				"filter" : {
					"or" : [{
						"term" : {
							"group" : id // match membership, group is not empty
						}
					}, {
						"term" : {
							"grantTo" : id // match perms granted to the group that will be deleted
						}
					}]
				}
			}
		}
	}
	
	this._checkIntegrity(query,  req, callback);

}


RestGroup.prototype._postDel = function(err, obj, req, callback) {

	if(err !== null && !( err instanceof models.errors.ObjectDoesNotExist)) {
		callback();
		return;
	}
	
	
	var methods = [];

	obj.computedWriteUsersPerms.forEach(function(id) {
		methods.push(this._getPermDeleteMethod(obj, id, 'GroupWriteUser'));
	}.bind(this));
	
	obj.computedWriteGroupsPerms.forEach(function(id) {
		methods.push(this._getPermDeleteMethod(obj, id, 'GroupWriteGroup'));
	}.bind(this));
	
	async.parallel(methods, function() {
		callback();
	});
}

RestGroup.prototype.permsUserWrite = function (req, res) {
	var permClass = models.perms.getPermClass('group', 'user', 'write'), grantToClass = models.User;
	this._perms(req, res, permClass, grantToClass);
}


RestGroup.prototype.permsGroupWrite = function (req, res) {
	var permClass = models.perms.getPermClass('group', 'group', 'write'), grantToClass = models.Group;
	this._perms(req, res, permClass, grantToClass);
}

RestGroup.prototype.memberships = function(req, res) {
	
	var q = {
		query : {term : { group : '/group/' + req.params.id}}};
	
	
	var tasks = [
		
		function (callback) {
			models.Membership.search(q,  ["user", "createDate", "updateDate"], function ( err, result) {
				
				if (err !== null) {
					callback(err)
				} else {
					callback(null,  result);
				}
				
			});
		}
	];
	
	if (req.query.include_docs == true || (typeof(req.query.include_docs) !== 'undefined' && req.query.include_docs.toLowerCase() == 'true')) {
		tasks.push(function (result, callback) {
			
			if (result.rows.length > 0) {
				
			
			
			var ids = [];
			var byuser = {};
			
			for (var i = 0, l = result.rows.length; i < l;i++) {
				ids.push(result.rows[i].user)
				byuser[result.rows[i].user] = result.rows[i];
			}
			
			var q = {size: 10000, query : {ids : {values : ids}}}
			
			models.User.search(q, models.User.publicAttributes, function ( err, users) {
				
				if (err !== null) {
					callback(err);
				} else {
					
					for (var i = 0, l = users.rows.length; i<l; i++ ) {
						byuser[users.rows[i].id].user = users.rows[i];
					}
					callback(null,  result);
				}
			});
			} else {
				callback(null,  result);
			}
		});
	}
	
	async.waterfall(tasks, function ( err, result) {
		if (err !== null) {
			if (err instanceof errors.IndexDoesNotExist) {
				res.statusCode = statusCode.NOT_FOUND;
				res.end('Not found');
			} else {
				res.statusCode = statusCode.INTERNAL_ERROR;
				res.end('Internal error')
			}
		} else {
			res.end(this._renderJson(req, res, result));
		}
	}.bind(this));
	
	
}