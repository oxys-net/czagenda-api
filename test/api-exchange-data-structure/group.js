var vows = require('vows');
var assert = require('assert');
var Rest = require('../../libs/rest-client.js').Rest;

var statusCode = require('../../libs/statusCodes.js');
var settings = require('../../settings.js');
var tests_data = require('../tests_data');

var date_re = new RegExp("^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}Z$");
var number_re = new RegExp("^[0-9]+$");

var data_keys = ['title', 'description', 'writeUsers', 'writeGroups', 'id', 'createDate', 'updateDate', 'users'].sort();

// CREATION
var create_test_data = {
	title : 'TITLE_GROUP_1',
	description : 'DESCRIPTION_GROUP_1'
}

var create_test_data_expected = {
	title : 'TITLE_GROUP_1',
	description : 'DESCRIPTION_GROUP_1',
	id : '/group/title-group-1',
	users : '/group/title-group-1/users',
	writeUsers : '/group/title-group-1/perms/wu',
	writeGroups : '/group/title-group-1/perms/wg'
}

var create_invalid_test_data = {
	description : 'DESCRIPTION_GROUP_1'
}

var create_invalid_test_data_expected = { title: [ 'a string is required' ]};	

// UPDATE
var update_test_data_in_database = tests_data.group_2;

var update_test_data = {
	title : 'MODIFIED_TITLE_GROUP_2',
	description : 'MODIFIED_DESCRIPTION_GROUP_2'
}

var update_test_data_expected = {
	title : 'MODIFIED_TITLE_GROUP_2',
	description : 'MODIFIED_DESCRIPTION_GROUP_2',
	id : '/group/title-group-2',
	users : '/group/title-group-2/users',
	createDate : tests_data.group_2.createDate,
	writeUsers : '/group/title-group-2/perms/wu',
	writeGroups : '/group/title-group-2/perms/wg'
}

// GET
var get_test_data_in_database = tests_data.group_3;

var delete_test_data_in_database = tests_data.group_4;


vows.describe('Group API exchanged data structure').addBatch({

	'CREATE' : {
		topic : function() {
			rest = new Rest();
			rest.post('/group', JSON.stringify(create_test_data), this.callback);
		},
		
		'check statusCode is 201' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.CREATED);
		},
		
		'check createDate' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.equal(date_re.test(data.createDate), true);
		},
		
		'check updateDate' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.equal(data.createDate, data.updateDate);
		},
		
		'check response structure' : function(err, res, data) {
			var data = JSON.parse(data);
			
			delete data.createDate;
			delete data.updateDate;
						
			assert.deepEqual(data, create_test_data_expected);
		}
		
	},

	'CREATE INVALID' : {
		topic : function() {
			rest = new Rest();
			rest.post('/group', JSON.stringify(create_invalid_test_data), this.callback);
		},
		
		'check statusCode is 400' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.BAD_REQUEST);
		},
		
		'check validation errors' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.deepEqual(data, create_invalid_test_data_expected)
		}
	},

	'UPDATE' : {
		topic : function() {
			rest = new Rest();
			rest.put(update_test_data_in_database.id, JSON.stringify(update_test_data), this.callback);
		},
				
		'check updateDate' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.notEqual(data.createDate, data.updateDate);
			assert.equal(date_re.test(data.updateDate), true);
		},
		
		'check statusCode is 200' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.ALL_OK);
		},
				
		'check response structure' : function(err, res, data) {
			var data = JSON.parse(data);
			delete data.updateDate;
						
			assert.deepEqual(data, update_test_data_expected);
		}
		
	},

	'GET' : {
		topic : function() {
			rest = new Rest();
			rest.get(get_test_data_in_database.id, this.callback);
		},
		
		'check statusCode is 200' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.ALL_OK);
		},
		
		'check response structure' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.deepEqual(data, get_test_data_in_database);
		}
	},
	
	'GET LIST' : {
		topic : function() {
			rest = new Rest();
			rest.get('/group',  this.callback);
		},
		
		'check statusCode is 200' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.ALL_OK);
		},
		
		'check total_rows is an integer' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.equal(number_re.test(data.total_rows), true);
		},
		
		'check offset is an integer' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.equal(number_re.test(data.offset), true);
		},
		
		'check offset value is zero' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.strictEqual(data.offset, 0);
		},
		
		'check rows is an array' : function(err, res, data) {
			var data = JSON.parse(data);
			assert.notEqual(data.rows.constructor.toString().indexOf("Array"), -1);
		},
				
		'check rows item structure' : function(err, res, data) {
			var data = JSON.parse(data);
			
			for (var i = 0, l = data.rows.length; i<l; i++) {
				
				var keys = [];
				for (k in data.rows[i]) {
					keys.push(k)
				}
				
				assert.deepEqual(keys.sort(), data_keys);
			}
			
		}
	},
	
	'DELETE' : {
		topic : function() {
			rest = new Rest();
			rest.del(delete_test_data_in_database.id, this.callback);
		},
		'check statusCode is 204' : function(err, res, data) {
			assert.equal(res.statusCode, statusCode.DELETED);
		}
	}

}).export(module);
