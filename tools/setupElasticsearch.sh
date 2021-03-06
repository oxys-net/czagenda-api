

if [ -z $1 ]
then
echo "You must provide dbname as first argument";
exit 0;
fi

if [ -z $2 ]
then
echo "You must provide server ip as second argument";
exit 0;
fi

curl -XDELETE http://$2:9200/$1;

curl -XPUT http://$2:9200/$1 -d '{"index" : {
    "number_of_shards" : 3,
    "number_of_replicas" : 2}}'

#curl -XPUT http://$2:9200/$1

curl -XPUT "http://$2:9200/$1/oauth-token/_mapping" -d '{
	"oauth-token": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"user" :  {"type" : "string", "index" : "not_analyzed"},
			"tokenType" :  {"type" : "string", "index" : "not_analyzed"},
			"consumer" :  {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/oauth-consumer/_mapping" -d '{
	"oauth-consumer": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"user" :  {"type" : "string", "index" : "not_analyzed"},
			"name": {
					"type" : "multi_field",
	                "fields" : {
	                    "name" : {"type" : "string", "index" : "analyzed"},
	                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
	                }
				}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/event/_mapping" -d '{
	"event": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"author" :  {"type" : "string", "index" : "not_analyzed"},
			"agenda" :  {"type" : "string", "index" : "not_analyzed"},
			"approvedBy" :  {"type" : "string", "index" : "not_analyzed"},
			"disapprovedBy" :  {"type" : "string", "index" : "not_analyzed"},
			"computedWriteGroups" : {"type" : "string", "index" : "not_analyzed"},
			"computedWriteUsers" : {"type" : "string", "index" : "not_analyzed"},
			"computedReadGroups" : {"type" : "string", "index" : "not_analyzed"},
			"computedReadUsers" : {"type" : "string", "index" : "not_analyzed"},
			"event" : {
				"properties": {
					"title": {
						"type" : "multi_field",
		                "fields" : {
		                    "title" : {"type" : "string", "index" : "analyzed"},
		                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
		                }
					},
					"category" :  {"type" : "string", "index" : "not_analyzed"},
					"childEvents" :  {"type" : "string", "index" : "not_analyzed"},
					"parentEvent" :  {"type" : "string", "index" : "not_analyzed"},

					"where": {
						"properties": {
							"geoPt": {
								"type": "geoPoint",
								"store" : true
							},
              "country" : {
                "type" : "string", "index" : "not_analyzed"
              }
						}
					},
					"who": {
						"properties": {
							"href": {
								"type" : "string", "index" : "not_analyzed"
							}
						}
					},
					"when" : {
						"properties" : {
							"startTime" : {
								 "type" : "date"
							},
							"endTime" : {
								 "type" : "date"
							}
						}
					}
				}
			}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/entity/_mapping" -d '{
	"entity": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},

			"entity" : {
				"properties": {
					"name": {
						"type" : "multi_field",
		                "fields" : {
		                    "name" : {"type" : "string", "index" : "analyzed"},
		                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
		                }
					},
					"firstName": {
						"type" : "multi_field",
		                "fields" : {
		                    "firstName" : {"type" : "string", "index" : "analyzed"},
		                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
		                }
					},
					"lastName": {
						"type" : "multi_field",
		                "fields" : {
		                    "lastName" : {"type" : "string", "index" : "analyzed"},
		                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
		                }
					},
					"where": {
						"properties": {
							"geoPt": {
								"type": "geoPoint",
								"store" : true
							}
						}
					}
				}
			}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/agenda/_mapping" -d '{
	"agenda": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"title": {
				"type" : "multi_field",
                "fields" : {
                    "title" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			},
			"computedWriteGroups" : {"type" : "string", "index" : "not_analyzed"},
			"computedWriteUsers" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/category/_mapping" -d '{
	"category": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"title": {
				"type" : "multi_field",
                "fields" : {
                    "title" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/group/_mapping" -d '{
	"group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"title": {
				"type" : "multi_field",
                "fields" : {
                    "title" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			},
			"computedWriteGroups" : {"type" : "string", "index" : "not_analyzed"},
			"computedWriteUsers" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/user/_mapping" -d '{
	"user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"joinedDate" : {
				 "type" : "date"
			},
			"lastSeen" : {
				 "type" : "date"
			},
			"login": {
				"type" : "multi_field",
                "fields" : {
                    "login" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			},
			"firstName": {
				"type" : "multi_field",
                "fields" : {
                    "firstName" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			},
			"lastName": {
				"type" : "multi_field",
                "fields" : {
                    "lastName" : {"type" : "string", "index" : "analyzed"},
                    "untouched" : {"type" : "string", "index" : "not_analyzed"}
                }
			}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/membership/_mapping" -d '{
	"membership": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"user" : {"type" : "string", "index" : "not_analyzed"},
			"group" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/agenda-write-user/_mapping" -d '{
	"agenda-write-user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/agenda-write-group/_mapping" -d '{
	"agenda-write-group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/entity-write-user/_mapping" -d '{
	"entity-write-user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/entity-write-group/_mapping" -d '{
	"entity-write-group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

curl -XPUT "http://$2:9200/$1/group-write-user/_mapping" -d '{
	"group-write-user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/group-write-group/_mapping" -d '{
	"group-write-group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/event-write-user/_mapping" -d '{
	"event-write-user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/event-write-group/_mapping" -d '{
	"event-write-group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/event-read-user/_mapping" -d '{
	"event-read-user": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';
curl -XPUT "http://$2:9200/$1/event-read-group/_mapping" -d '{
	"event-read-group": {
		"properties" : {
			"createDate" : {
				 "type" : "date"
			},
			"updateDate" : {
				 "type" : "date"
			},
			"applyOn" : {"type" : "string", "index" : "not_analyzed"},
			"grantTo" : {"type" : "string", "index" : "not_analyzed"}
		}
	}
}';

