#import <Foundation/Foundation.h>
@class MyData;
@class Data;
@class Todo;
@interface Todo:NSObject
@property(nonatomic,retain)NSNumber  *todo_type;
@property(nonatomic,copy)NSString  *ico;
@property(nonatomic,copy)NSString  *todo_uid;
@property(nonatomic,copy)NSString  *Id;
@property(nonatomic,copy)NSString  *approver;
@property(nonatomic,copy)NSString  *users;
@property(nonatomic,copy)NSString  *app_name;
@property(nonatomic,copy)NSString  *readTime;
@property(nonatomic,copy)NSString  *allTarget;
@property(nonatomic,copy)NSString  *target;
@property(nonatomic,retain)NSNumber  *hot;
@property(nonatomic,copy)NSString  *approveId;
@property(nonatomic,copy)NSString  *description;
@property(nonatomic,copy)NSString  *agent_id;
@property(nonatomic,copy)NSString  *appId;
@property(nonatomic,retain)NSNumber  *revoke;
@property(nonatomic,retain)NSNumber  *reminding;
@property(nonatomic,copy)NSString  *templateName;
@property(nonatomic,copy)NSString  *relationId;
@property(nonatomic,copy)NSString  *receiver;
@property(nonatomic,copy)NSString  *sendTime;
@property(nonatomic,retain)MyData  *myData;
@property(nonatomic,copy)NSString  *agent_name;
@property(nonatomic,retain)NSNumber  *todo_status;
@property(nonatomic,copy)NSString  *name;
@property(nonatomic,copy)NSString  *model;
@property(nonatomic,retain)NSNumber  *count;
@property(nonatomic,copy)NSString  *status;
@property(nonatomic,retain)NSMutableArray<Data*>  *data;
@property(nonatomic,retain)NSNumber  *sendType;
@property(nonatomic,copy)NSString  *mobile;
@property(nonatomic,copy)NSString  *pc;
@property(nonatomic,copy)NSString  *sign;
@property(nonatomic,retain)NSMutableArray  *privateData;
@property(nonatomic,copy)NSString  *appid;
@property(nonatomic,retain)NSNumber  *read;
@property(nonatomic,copy)NSString  *publisher;
@property(nonatomic,copy)NSString  *openid;
@property(nonatomic,retain)NSNumber  *schoolId;
@property(nonatomic,retain)Todo  *todo;
@property(nonatomic,copy)NSString  *objApp;
@property(nonatomic,copy)NSString  *title;
@property(nonatomic,copy)NSString  *app_uid;
@property(nonatomic,copy)NSString  *startDate;
@end
