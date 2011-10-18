var BasePermission = require('./base.js').BasePermission;
var Base = require('../base.js').Base;
var util = require("util");
var settings = require('../../settings.js');
var models = require('../../models');
const type = 'event-write-group'

function EventWriteGroup () {
	BasePermission.call(this, type);	
}

util.inherits(EventWriteGroup, BasePermission);

EventWriteGroup.publicAttributes = Base.publicAttributes.concat(['grantTo', 'applyOn']);
EventWriteGroup.staffAttributes = EventWriteGroup.publicAttributes.concat(Base.staffAttributes);

EventWriteGroup.publicWriteAttributes = ['grantTo', 'applyOn'];
EventWriteGroup.staffWriteAttributes = EventWriteGroup.publicWriteAttributes;

EventWriteGroup.prototype._generateId = function(doc) {
	return '/perms/event/wg/' + this._generateUUID();
}

EventWriteGroup.prototype._validate = function (callback) {
	this.validateRegexp('applyOn', '^/event/[\-_\.0-9a-z]+$', false);
	this.validateRegexp('grantTo', '^/group/[\-_\.0-9a-z]+$', false);
	callback(null);
}

EventWriteGroup.prototype._postSave = function (err, next) {
	
	if (err !== null && !(err instanceof models.errors.ObjectAlreadyExists)) {
		next();
		return;
	}
	
	this.updateComputedValue(models.Event, 'computedWriteGroups', true, next);
}

EventWriteGroup.prototype._postDel = function (err, next) {
	
	if (err !== null && !(err instanceof models.errors.ObjectAlreadyExists)) {
		next();
		return;
	}
	
	this.updateComputedValue(models.Event, 'computedWriteGroups', false, next);
}

EventWriteGroup.prototype.hasPerm = function(perm, user, callback) {
	BasePermission.prototype.hasPerm.call(this, models.Event, perm, user, callback);
}

EventWriteGroup.get = function(options, callback) {
	Base.get(options, EventWriteGroup, callback)
}

EventWriteGroup.search = function(query, attrs,callback) {
	Base.search(query, settings.elasticsearch.index, type, attrs,EventWriteGroup, callback)
}

EventWriteGroup.count = function(query, callback) {
	Base.count(query, settings.elasticsearch.index, type,callback)
}


module.exports = EventWriteGroup;