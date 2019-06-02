#import <Foundation/Foundation.h>
@class Notice;
@class UserId;
@interface Notice:NSObject
@property(nonatomic,retain)NSNumber  *Id;
@property(nonatomic,retain)Notice  *notice;
@property(nonatomic,copy)NSString  *uid;
@property(nonatomic,retain)NSNumber  *schoolId;
@property(nonatomic,copy)NSString  *mobile;
@property(nonatomic,retain)NSNumber  *count;
@property(nonatomic,copy)NSString  *title;
@property(nonatomic,retain)UserId  *userId;
@property(nonatomic,copy)NSString  *createTime;
@property(nonatomic,copy)NSString  *cover;
@property(nonatomic,copy)NSString  *pc;
@property(nonatomic,copy)NSString  *content;
@end