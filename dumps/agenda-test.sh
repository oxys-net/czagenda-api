curl -XPUT http://10.7.50.110:9200/agenda-test/oauth-consumer/%2Foauth-consumer%2FClQAKmvtaL4DkZNJ4e -d '{"type":"oauth-consumer","name":"czagenda-web","description":"czagenda-web","key":"ClQAKmvtaL4DkZNJ4e","secret":"0zwR0yssaYWdpp4mN9FzmQAuN1RUhiLd","status":"ACCEPTED","user":"/user/root","createDate":"2011-10-06T13:55:22.379Z","updateDate":"2011-10-06T13:55:22.379Z","hash":"ff0edb202639f89b21ed9d117d822803"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/oauth-token/%2Foauth-token%2FJC2GDhZwgOOsClEOdv -d '{"type":"oauth-token","key":"JC2GDhZwgOOsClEOdv","secret":"QTW6WLX7m6hrJ9pJ0HehaNI8OSFLfz6P","verifier":null,"tokenType":"ACCESS","isApproved":true,"user":"/user/root","consumer":"/oauth-consumer/ClQAKmvtaL4DkZNJ4e","callback":null,"callbackConfirmed":false,"createDate":"2011-10-06T13:55:22.401Z","updateDate":"2011-10-06T13:55:22.401Z","hash":"dc37c6069d90d0b77141aa62c7d133a0"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-2 -d '{"hash":"966569359e962cf2ce848b6fb84ede03","type":"user","login":"LOGIN_USER_2","firstName":"FIRST_NAME_USER_2","lastName":"LAST_NAME_USER_2","email":"EMAIL_USER_2@domain.com","password":"PASSWORD_USER_2","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":null,"dateJoined":null,"groups":"/user/login-user-2/groups","createDate":"2011-09-21T14:10:27.222Z","updateDate":"2011-09-21T14:10:27.222Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-7 -d '{"hash":"6bc5891bb8f14f7214a372dd74dbc6d3","type":"user","login":"LOGIN_USER_7","firstName":"FIRST_NAME_USER_7","lastName":"LAST_NAME_USER_7","email":"EMAIL_USER_7@domain.com","password":"PASSWORD_USER_7","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":"2011-09-08T13:40:00.000Z","dateJoined":"2011-09-08T13:30:00.000Z","groups":"/user/login-user-7/groups","createDate":"2011-09-21T14:11:43.703Z","updateDate":"2011-09-21T14:11:43.703Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/membership/%2Fmembership%2Fc4d4341d5ada5492bee888db0cc902dd -d '{"hash":"94039b61d77a80244352c4c0f239cb80","type":"membership","user":"/user/login-user-5","group":"/group/title-group-5","createDate":"2011-09-21T14:31:39.362Z","updateDate":"2011-09-21T14:31:39.362Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-read-group/%2Fperms%2Fevent%2Frg%2Fef822b475a692b42cab1188a015a1b13 -d '{"hash":"79a9a093d20bc3f86850772ff473a93d","type":"event-read-group","grantTo":"/group/title-group-2","applyOn":"/event/295384e87e6c0761caec6995a7922f44","createDate":"2011-09-22T15:03:23.172Z","updateDate":"2011-09-22T15:03:23.172Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-read-user/%2Fperms%2Fevent%2Fru%2F937aad23c7364c01359f22af4eb396af -d '{"hash":"5abda5d932f965cfa9cd9585535d9df9","type":"event-read-user","grantTo":"/user/login-user-2","applyOn":"/event/295384e87e6c0761caec6995a7922f44","createDate":"2011-09-22T15:03:23.170Z","updateDate":"2011-09-22T15:03:23.170Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-read-group/%2Fperms%2Fevent%2Frg%2Fbdedb9616439fa47c56b6d27e5f2b66a -d '{"hash":"ca4a674758e6bc89a675171edff82e45","type":"event-read-group","grantTo":"/group/title-group-2","applyOn":"/event/80c22a5b8fa95ddbe73ac218a07704bc","createDate":"2011-09-22T15:03:23.194Z","updateDate":"2011-09-22T15:03:23.194Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event/%2Fevent%2Fd9adce07499071b73636aafbfe91aa78 -d '{"_index":"agenda-test","_type":"event","_id":"/event/d9adce07499071b73636aafbfe91aa78","_version":1,"exists":true,"_source":{"hash":"3a6be7616ae82bfded33597819e1cd03","type":"event","approved":[],"disapproved":[],"event":{"title":"title event 3","id":"/event/d9adce07499071b73636aafbfe91aa78"},"author":"/user/login-user-2","writeGroups":"/event/d9adce07499071b73636aafbfe91aa78/perms/wg","readGroups":"/event/d9adce07499071b73636aafbfe91aa78/perms/rg","writeUsers":"/event/d9adce07499071b73636aafbfe91aa78/perms/wu","readUsers":"/event/d9adce07499071b73636aafbfe91aa78/perms/ru","createDate":"2011-09-21T12:56:22.189Z","updateDate":"2011-09-21T12:56:22.189Z","agenda":null},"hash":"3a6be7616ae82bfded33597819e1cd03","type":"event","approved":[],"disapproved":[],"agenda":null,"event":{"title":"title event 3","links":[{"rel":"describedby","href":"/schema/event"}],"where":[{"valueString":"Pau"}]},"author":"/user/login-user-2","writeGroups":"/event/d9adce07499071b73636aafbfe91aa78/perms/wg","readGroups":"/event/d9adce07499071b73636aafbfe91aa78/perms/rg","writeUsers":"/event/d9adce07499071b73636aafbfe91aa78/perms/wu","readUsers":"/event/d9adce07499071b73636aafbfe91aa78/perms/ru","createDate":"2011-09-21T12:56:22.189Z","updateDate":"2011-10-12T10:56:56.545Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F6cc673b9d190108ed8762e18c89d36be -d '{"type":"group-write-user","grantTo":"/user/test","applyOn":"/group/title-group-6","createDate":"2011-10-17T09:01:18.841Z","updateDate":"2011-10-17T09:01:18.841Z","hash":"aa29b4aeaaaae711ec47c1628a1df2f4"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda/%2Fagenda%2Ftitle-agenda-4 -d '{"hash":"a78ab9fca915aec1dda0884b769dccdd","type":"agenda","title":"TITLE_AGENDA_4","description":"DESCRIPTION_AGENDA_4","writeGroups":"/agenda/title-agenda-4/perms/wg","writeUsers":"/agenda/title-agenda-4/perms/wu","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-21T12:47:31.115Z","updateDate":"2011-09-21T12:47:31.115Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group/%2Fgroup%2Ftitle-group-2 -d '{"hash":"ea61b9991d4fc9bcb03531aa74bc5465","type":"group","title":"TITLE_GROUP_2","description":"DESCRIPTION_GROUP_2","writeGroups":"/group/title-group-2/perms/wg","writeUsers":"/group/title-group-2/perms/wu","users":"/group/title-group-2/users","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-21T13:18:38.297Z","updateDate":"2011-09-21T13:18:38.297Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fname-schema-2 -d '{"author":"/user/test","hash":"fa75d57936e89ec735d6d21051d61a45","type":"schema","schema":{"id":"/schema/name-schema-2"},"final":false,"sample":"","template":"","status":"PROPOSAL","name":"NAME_SCHEMA_2","createDate":"2011-09-21T13:47:40.034Z","updateDate":"2011-09-21T13:47:40.034Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-3 -d '{"hash":"1588dfcf3a20b177f507f29b4167f0ad","type":"user","login":"LOGIN_USER_3","firstName":"FIRST_NAME_USER_3","lastName":"LAST_NAME_USER_3","email":"EMAIL_USER_3@domain.com","password":"PASSWORD_USER_3","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":"2011-09-08T13:40:00.000Z","dateJoined":"2011-09-08T13:30:00.000Z","groups":"/user/login-user-3/groups","createDate":"2011-09-21T14:10:27.223Z","updateDate":"2011-09-21T14:10:27.223Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda-write-user/%2Fperms%2Fagenda%2Fwu%2Fa0b0ed1b9e71727aa122b9128c92f060 -d '{"hash":"dbc06d1cdfade617f790bec72dfbc5bc","type":"agenda-write-user","grantTo":"/user/login-user-2","applyOn":"/agenda/title-agenda-3","createDate":"2011-09-22T14:55:54.594Z","updateDate":"2011-09-22T14:55:54.594Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda-write-group/%2Fperms%2Fagenda%2Fwg%2F4f2cc8435412530726af48d8cbf3c60a -d '{"hash":"246153b8d9074d3b66ca77d36b6fabbd","type":"agenda-write-group","grantTo":"/group/title-group-2","applyOn":"/agenda/title-agenda-2","createDate":"2011-09-22T14:55:54.595Z","updateDate":"2011-09-22T14:55:54.595Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F27a116182057a8be34749e55c02b1e52 -d '{"hash":"7eb1c2a261c659076b717dfaee7fe21a","type":"group-write-user","grantTo":"/user/login-user-2","applyOn":"/group/title-group-5","createDate":"2011-09-22T14:59:29.621Z","updateDate":"2011-09-22T14:59:29.621Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/oauth-token/%2Foauth-token%2FrkPs43b7LJO3TXAEDk -d '{"type":"oauth-token","key":"rkPs43b7LJO3TXAEDk","secret":"4T2LLM9AGMz5j5Dzg57UvnLgjZLy8zCt","verifier":null,"tokenType":"ACCESS","isApproved":true,"user":"/user/test","consumer":"/oauth-consumer/WqwaFDGgfwuAhta5O6","callback":null,"callbackConfirmed":false,"createDate":"2011-10-06T14:53:49.422Z","updateDate":"2011-10-06T14:53:49.422Z","hash":"052871b3b9a0e261b4522f05cbc7112b"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fwho -d '{"type":"schema","schema":{"description":"A person associated with the containing entity. The type of the association is determined by the rel attribute; the details about the person are contained in an embedded or linked-to Contact entry.","type":"object","additionalProperties":false,"properties":{"email":{"description":"Email address","type":"string","format":"email","required":false},"rel":{"description":"Specifies the relationship between the containing entity and the contained person. ","type":"string","required":false,"enum":["attendee","organizer","performer","speaker"]},"valueString":{"description":"A simple string value that can be used as a representation of this person.","type":"string","required":false},"attendeeStatus":{"description":"Status of event attendee.","type":"string","required":false,"enum":["accepted","declined","invited","tentative"]},"attendeeType":{"description":"Type of event attendee.","type":"string","required":false,"enum":["optional","required"]}},"id":"/schema/who"},"final":true,"sample":null,"template":null,"status":"APPROVED","name":"who","description":null,"author":"/user/jh.pinson","createDate":"2011-10-12T08:31:50.071Z","updateDate":"2011-10-12T08:31:50.071Z","hash":"d1b2992becaeb1055b404ab70adb7b3b"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Flocalization -d '{"type":"schema","schema":{"type":"object","description":"Localization description","additionalProperties":false,"properties":{"city":{"type":"string","required":false},"country":{"type":"string","required":false},"admin_level_2":{"description":"Administrative level such as region, state, etc...","type":"string","required":false},"admin_level_3":{"description":"Administrative level such as department, metropolitan area, etc...","type":"string","required":false},"geoPt":{"$ref":"/schema/geo","required":false},"valueString":{"description":"A simple string value that can be used as a representation of this localization.","type":"string","required":false}},"id":"/schema/localization"},"final":true,"sample":null,"template":null,"status":"APPROVED","name":"localization","description":null,"author":"/user/jh.pinson","createDate":"2011-10-12T08:34:14.838Z","updateDate":"2011-10-12T08:34:14.838Z","hash":"e92ab95ea876a1c1f9fd29afd6e39eb9"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group/%2Fgroup%2Ftitle-group-6 -d '{"type":"group","title":"TITLE_GROUP_6","description":"DESCRIPTION_GROUP_6","writeGroups":"/group/title-group-6/perms/wg","writeUsers":"/group/title-group-6/perms/wu","users":"/group/title-group-6/users","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-10-17T09:01:18.853Z","updateDate":"2011-10-17T09:01:18.853Z","hash":"c2abcbd229f79ac2f45c821e1c07213a"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda/%2Fagenda%2Ftitle-agenda-3 -d '{"hash":"9a01ee9704d95c4b35fc856e04c2a4d3","type":"agenda","title":"TITLE_AGENDA_3","description":"DESCRIPTION_AGENDA_3","writeGroups":"/agenda/title-agenda-3/perms/wg","writeUsers":"/agenda/title-agenda-3/perms/wu","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-21T12:47:31.117Z","updateDate":"2011-09-21T12:47:31.117Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda-write-user/%2Fperms%2Fagenda%2Fwu%2F193e3df80d40d2798f6ba2bd42e655d3 -d '{"type":"agenda-write-user","grantTo":"/user/test","applyOn":"/agenda/title-agenda-4","createDate":"2011-10-18T06:57:24.843Z","updateDate":"2011-10-18T06:57:24.843Z","hash":"653ee9fe9a9b57c9521ace47ed33e284"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F870203318fed3392575f7a304db505a2 -d '{"type":"group-write-user","grantTo":"/user/test","applyOn":"/group/title-group-2","createDate":"2011-10-18T07:13:28.688Z","updateDate":"2011-10-18T07:13:28.688Z","hash":"1eda4549ddc5601b2d26370dfb9c4ae2"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F10ef829fa11f94643a96d92b1e67c35e -d '{"type":"group-write-user","grantTo":"/user/test","applyOn":"/group/title-group-5","createDate":"2011-10-18T07:13:30.791Z","updateDate":"2011-10-18T07:13:30.791Z","hash":"48a0d0eeedfb989e8688cfe1e1e0c32a"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fname-schema-3 -d '{"author":"/user/test","hash":"77e882f70e804d7ad8ab3b44949c7ff0","type":"schema","schema":{"description":"schema description","id":"/schema/name-schema-3"},"final":true,"sample":"sample data","template":"template data","status":"APPROVED","name":"NAME_SCHEMA_3","createDate":"2011-09-21T13:47:40.036Z","updateDate":"2011-09-21T13:47:40.036Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-4 -d '{"hash":"edae136a58b84dab1e1743aec0898df0","type":"user","login":"LOGIN_USER_4","firstName":"FIRST_NAME_USER_4","lastName":"LAST_NAME_USER_4","email":"EMAIL_USER_4@domain.com","password":"PASSWORD_USER_4","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":"2011-09-08T13:40:00.000Z","dateJoined":"2011-09-08T13:30:00.000Z","groups":"/user/login-user-4/groups","createDate":"2011-09-21T14:10:27.221Z","updateDate":"2011-09-21T14:10:27.221Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-write-group/%2Fperms%2Fevent%2Fwg%2Fb5c3e304a201d0c67c43b9e9611fb4f0 -d '{"hash":"51ac2822ddef0b87d30b21e5c84adbe5","type":"event-write-group","grantTo":"/group/title-group-2","applyOn":"/event/295384e87e6c0761caec6995a7922f44","createDate":"2011-09-22T15:03:23.171Z","updateDate":"2011-09-22T15:03:23.171Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Ftest -d '{"type":"user","login":"test","firstName":"test","lastName":"test","email":"test@oxys.net","password":"test","isActive":true,"isStaff":false,"isSuperuser":false,"lastLogin":null,"dateJoined":null,"groups":"/user/test/groups","createDate":"2011-10-06T14:52:56.382Z","updateDate":"2011-10-06T14:52:56.382Z","hash":"b30e2066f2f80d672662245b0a1553ad"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/oauth-consumer/%2Foauth-consumer%2FWqwaFDGgfwuAhta5O6 -d '{"type":"oauth-consumer","name":"Tests","description":"tests unitaires","key":"WqwaFDGgfwuAhta5O6","secret":"t2aX7mpZDJKwVivq2mUYn12UAl3VpsfJ","status":"ACCEPTED","user":"/user/test","createDate":"2011-10-06T14:53:18.236Z","updateDate":"2011-10-06T14:53:18.236Z","hash":"128f1bc3af9e98e71965c93f098d8a37"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fbase-abstract -d '{"type":"schema","schema":{"description":"Base schema","type":"object","properties":{"links":{"type":"array","minLength":1,"items":[{"description":"Link to the schema that describe the instance","href":{"type":"string","required":true},"rel":{"value":"describedby","required":true},"required":true}]}},"id":"/schema/base-abstract"},"final":false,"sample":null,"template":null,"status":"APPROVED","name":"base","description":null,"author":"/user/jh.pinson","createDate":"2011-10-12T08:31:49.043Z","updateDate":"2011-10-12T08:31:49.043Z","hash":"d4c9f8b37cd97c43b5b6f892244a49e6"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event/%2Fevent%2F295384e87e6c0761caec6995a7922f44 -d '{"_index":"agenda-test","_type":"event","_id":"/event/295384e87e6c0761caec6995a7922f44","_version":1,"exists":true,"_source":{"hash":"5ad86fca89bb3a62ac125eb4945bf7b1","type":"event","approved":[],"disapproved":[],"event":{"id":"/event/295384e87e6c0761caec6995a7922f44"},"author":"/user/login-user-2","writeGroups":"/event/295384e87e6c0761caec6995a7922f44/perms/wg","readGroups":"/event/295384e87e6c0761caec6995a7922f44/perms/rg","writeUsers":"/event/295384e87e6c0761caec6995a7922f44/perms/wu","readUsers":"/event/295384e87e6c0761caec6995a7922f44/perms/ru","createDate":"2011-09-21T12:56:22.192Z","updateDate":"2011-09-21T12:56:22.192Z","agenda":null},"hash":"5ad86fca89bb3a62ac125eb4945bf7b1","type":"event","approved":[],"disapproved":[],"agenda":null,"event":{"title":"title event 1","links":[{"rel":"describedby","href":"/schema/event"}],"where":[{"valueString":"Pau"}]},"author":"/user/login-user-2","writeGroups":"/event/295384e87e6c0761caec6995a7922f44/perms/wg","readGroups":"/event/295384e87e6c0761caec6995a7922f44/perms/rg","writeUsers":"/event/295384e87e6c0761caec6995a7922f44/perms/wu","readUsers":"/event/295384e87e6c0761caec6995a7922f44/perms/ru","createDate":"2011-09-21T12:56:22.192Z","updateDate":"2011-10-12T10:54:33.621Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event/%2Fevent%2F80c22a5b8fa95ddbe73ac218a07704bc -d '{"_index":"agenda-test","_type":"event","_id":"/event/80c22a5b8fa95ddbe73ac218a07704bc","_version":1,"exists":true,"_source":{"hash":"9b989a1e19fb0532e9c9f8e36eff1366","type":"event","approved":[],"disapproved":[],"event":{"title":"title event 2","id":"/event/80c22a5b8fa95ddbe73ac218a07704bc"},"author":"/user/login-user-2","writeGroups":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/wg","readGroups":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/rg","writeUsers":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/wu","readUsers":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/ru","createDate":"2011-09-21T12:56:22.193Z","updateDate":"2011-09-21T12:56:22.193Z","agenda":null},"hash":"9b989a1e19fb0532e9c9f8e36eff1366","type":"event","approved":[],"disapproved":[],"agenda":null,"event":{"title":"title event 2","links":[{"rel":"describedby","href":"/schema/event"}],"where":[{"valueString":"Pau"}]},"author":"/user/login-user-2","writeGroups":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/wg","readGroups":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/rg","writeUsers":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/wu","readUsers":"/event/80c22a5b8fa95ddbe73ac218a07704bc/perms/ru","createDate":"2011-09-21T12:56:22.193Z","updateDate":"2011-10-12T10:55:33.233Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda/%2Fagenda%2Ftitle-agenda-2 -d '{"hash":"1b55ebd21620d6b34574701b1783cb5b","type":"agenda","title":"TITLE_AGENDA_2","description":"DESCRIPTION_AGENDA_2","writeGroups":"/agenda/title-agenda-2/perms/wg","writeUsers":"/agenda/title-agenda-2/perms/wu","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-21T12:47:31.116Z","updateDate":"2011-09-21T12:47:31.116Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group/%2Fgroup%2Ftitle-group-5 -d '{"hash":"91571a6c667ff98d97617776a242cbe3","type":"group","title":"TITLE_GROUP_5","description":"DESCRIPTION_GROUP_5","writeGroups":"/group/title-group-5/perms/wg","writeUsers":"/group/title-group-5/perms/wu","users":"/group/title-group-5/users","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-21T13:18:38.296Z","updateDate":"2011-09-21T13:18:38.296Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Froot -d '{"type":"user","login":"root","firstName":null,"lastName":null,"email":"admin@oxys.net","password":"Moaq43sc","isActive":true,"isStaff":true,"isSuperuser":true,"lastLogin":null,"dateJoined":null,"groups":"/user/root/groups","createDate":"2011-10-06T13:53:56.505Z","updateDate":"2011-10-06T13:53:56.505Z","hash":"bef87b0dd47e1928f61ebacb7083dd91"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fname-schema-4 -d '{"author":"/user/test","hash":"77e882f70e804d7ad8ab3b44949c7ff0","type":"schema","schema":{"description":"schema description","id":"/schema/name-schema-4"},"final":true,"sample":"sample data","template":"template data","status":"REFUSED","name":"NAME_SCHEMA_4","createDate":"2011-09-21T13:54:47.513Z","updateDate":"2011-09-21T13:54:47.513Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-5 -d '{"hash":"8823c394517a05b641f1e14dc024bbd7","type":"user","login":"LOGIN_USER_5","firstName":"FIRST_NAME_USER_5","lastName":"LAST_NAME_USER_5","email":"EMAIL_USER_5@domain.com","password":"PASSWORD_USER_5","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":"2011-09-08T13:40:00.000Z","dateJoined":"2011-09-08T13:30:00.000Z","groups":"/user/login-user-5/groups","createDate":"2011-09-21T14:10:27.221Z","updateDate":"2011-09-21T14:10:27.221Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/membership/%2Fmembership%2F391e1344d06661e7cf087d00d8cbace3 -d '{"hash":"0d5bf1d157322b4689f1a390da30f513","type":"membership","user":"/user/login-user-7","group":"/group/title-group-5","createDate":"2011-09-21T14:31:39.359Z","updateDate":"2011-09-21T14:31:39.359Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-group/%2Fperms%2Fgroup%2Fwg%2F88e0d2e1a98eaf4bf1fee2e845bbc1a2 -d '{"hash":"a8478cf62524f15efac52c1b2c699b63","type":"group-write-group","grantTo":"/group/title-group-2","applyOn":"/group/title-group-3","createDate":"2011-09-22T14:59:29.622Z","updateDate":"2011-09-22T14:59:29.622Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-write-group/%2Fperms%2Fevent%2Fwg%2Fd9df03cef399b0518e8409b102badb84 -d '{"hash":"a9b4fe06197365e821e7e1c7c6152abf","type":"event-write-group","grantTo":"/group/title-group-2","applyOn":"/event/80c22a5b8fa95ddbe73ac218a07704bc","createDate":"2011-09-22T15:03:23.194Z","updateDate":"2011-09-22T15:03:23.194Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-read-user/%2Fperms%2Fevent%2Fru%2F0eff9f1e23304eda1a90b0dfc9c281bc -d '{"hash":"5806927d133df2ab4057b9bf7cc43c84","type":"event-read-user","grantTo":"/user/login-user-2","applyOn":"/event/80c22a5b8fa95ddbe73ac218a07704bc","createDate":"2011-09-22T15:03:23.189Z","updateDate":"2011-09-22T15:03:23.189Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fevent -d '{"type":"schema","schema":{"description":"Event","type":"object","extends":{"$ref":"/schema/base-abstract"},"additionalProperties":false,"properties":{"content":{"description":"Longer description of the event.","type":"string","required":false},"title":{"description":"Brief title for the event.","type":"string","required":true},"eventStatus":{"description":"Extensible enum","type":"string","enum":["canceled","confirmed","tentative"]},"when":{"description":"Event time. The startTime and endTime attributes must both be set, although for all-day events those attributes are only dates, with no times.","type":"array","minItems":1,"items":{"type":[{"type":"object","additionalProperties":false,"properties":{"startTime":{"description":"Describes when the event starts or (for zero-duration events) when it occurs. If the timezone is not specified, the observer s local timezone is assumed.","type":"string","required":true,"format":"date"},"endTime":{"description":"Describes when the event ends. If the timezone is not specified, the observer s local timezone is assumed.","type":"string","format":"date","required":false},"valueString":{"description":"A simple string value that can be used as a representation of this time period.","type":"string","required":false}}},{"type":"object","additionalProperties":false,"properties":{"startTime":{"description":"Describes when the event starts or (fo s zero-duration events) when it occurs. If the timezone is not specified, the observer s local timezone is assumed.","type":"string","required":true,"format":"date-time"},"endTime":{"description":"Describes when the event ends. If the timezone is not specified, the observer s local timezone is assumed.","type":"string","format":"date-time","required":false},"valueString":{"description":"A simple string value that can be used as a representation of this time period.","type":"string","required":false}}}]}},"where":{"description":"Location of the event","type":"array","required":true,"minItems":1,"items":{"$ref":"/schema/localization"}},"who":{"type":"array","required":false,"items":{"type":[{"$ref":"/schema/who"}]}}},"id":"/schema/event"},"final":true,"sample":null,"template":null,"status":"APPROVED","name":"event","description":null,"author":"/user/jh.pinson","createDate":"2011-10-12T08:34:26.662Z","updateDate":"2011-10-12T08:34:26.662Z","hash":"3734974e57ff5aed9522691f7a4d330e"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group/%2Fgroup%2Ftitle-group-4 -d '{"hash":"825bc43bd70b6df3a3b53456afd3fd82","type":"group","title":"TITLE_GROUP_4","description":"DESCRIPTION_GROUP_4","writeGroups":"/group/title-group-4/perms/wg","writeUsers":"/group/title-group-4/perms/wu","users":"/group/title-group-4/users","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-22T14:27:23.830Z","updateDate":"2011-09-22T14:27:23.830Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/user/%2Fuser%2Flogin-user-6 -d '{"hash":"1a176158f9ac3d56ec907f27d7bbdaa4","type":"user","login":"LOGIN_USER_6","firstName":"FIRST_NAME_USER_6","lastName":"LAST_NAME_USER_6","email":"EMAIL_USER_6@domain.com","password":"PASSWORD_USER_6","isActive":false,"isStaff":false,"isSuperuser":false,"lastLogin":"2011-09-08T13:40:00.000Z","dateJoined":"2011-09-08T13:30:00.000Z","groups":"/user/login-user-6/groups","createDate":"2011-09-21T14:10:27.220Z","updateDate":"2011-09-21T14:10:27.220Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda-write-group/%2Fperms%2Fagenda%2Fwg%2Fed916a5c649389e1ce261823437ef32e -d '{"hash":"0af7b85b0f7a7e68f73a2bd0da4280f1","type":"agenda-write-group","grantTo":"/group/title-group-2","applyOn":"/agenda/title-agenda-3","createDate":"2011-09-22T14:55:54.596Z","updateDate":"2011-09-22T14:55:54.596Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-group/%2Fperms%2Fgroup%2Fwg%2F186971137cf9faa08817bd4d6a8f1b88 -d '{"hash":"4de0e0bc6942779945f5bcb8770ede1b","type":"group-write-group","grantTo":"/group/title-group-2","applyOn":"/group/title-group-5","createDate":"2011-09-22T14:59:29.624Z","updateDate":"2011-09-22T14:59:29.624Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-write-user/%2Fperms%2Fevent%2Fwu%2F644cb75010646396521d359be8026c64 -d '{"hash":"5297345ba29f2742aff04f060a9a5973","type":"event-write-user","grantTo":"/user/login-user-2","applyOn":"/event/295384e87e6c0761caec6995a7922f44","createDate":"2011-09-22T15:03:23.169Z","updateDate":"2011-09-22T15:03:23.169Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/event-write-user/%2Fperms%2Fevent%2Fwu%2F72606c3ffbf91ff903a0ee1ac0ff47ec -d '{"hash":"cb24de6b35e21442f1d75b7789607d31","type":"event-write-user","grantTo":"/user/login-user-2","applyOn":"/event/80c22a5b8fa95ddbe73ac218a07704bc","createDate":"2011-09-22T15:03:23.168Z","updateDate":"2011-09-22T15:03:23.168Z"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/schema/%2Fschema%2Fgeo -d '{"type":"schema","schema":{"type":"object","description":"Localization coordinates","additionalProperties":false,"properties":{"lat":{"type":"number","required":true},"lon":{"type":"number","required":true}},"id":"/schema/geo"},"final":true,"sample":null,"template":null,"status":"APPROVED","name":"geo","description":null,"author":"/user/jh.pinson","createDate":"2011-10-12T08:31:51.099Z","updateDate":"2011-10-12T08:31:51.099Z","hash":"328924ace026b91c5853636227a749fa"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/agenda-write-user/%2Fperms%2Fagenda%2Fwu%2F181f732cd8553a6f844cf19f53cfae67 -d '{"type":"agenda-write-user","grantTo":"/user/test","applyOn":"/agenda/title-agenda-2","createDate":"2011-10-18T06:57:24.170Z","updateDate":"2011-10-18T06:57:24.170Z","hash":"cf9ef02eb770894b1f487f108459bd0e"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F04148c5b74052f609c1751beff379e5e -d '{"type":"group-write-user","grantTo":"/user/test","applyOn":"/group/title-group-3","createDate":"2011-10-18T07:13:29.139Z","updateDate":"2011-10-18T07:13:29.139Z","hash":"a7d9f47930e77eabea4a38d2258e748f"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group-write-user/%2Fperms%2Fgroup%2Fwu%2F3c5f358e66132da75a6f83e14e8c5303 -d '{"type":"group-write-user","grantTo":"/user/test","applyOn":"/group/title-group-4","createDate":"2011-10-18T07:13:29.562Z","updateDate":"2011-10-18T07:13:29.562Z","hash":"144e40d02035e872243241e00fbf5e8b"}';
curl -XPUT http://10.7.50.110:9200/agenda-test/group/%2Fgroup%2Ftitle-group-3 -d '{"hash":"941650dd334cbb31c10f536a452e83e4","type":"group","title":"TITLE_GROUP_3","description":"DESCRIPTION_GROUP_3","writeGroups":"/group/title-group-3/perms/wg","writeUsers":"/group/title-group-3/perms/wu","users":"/group/title-group-3/users","computedWriteUsers":["/user/test"],"computedWriteGroups":[],"createDate":"2011-09-22T14:27:23.831Z","updateDate":"2011-09-22T14:27:23.831Z"}';