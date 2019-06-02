#import "Notice.h"
#import "Notice.h"
#import "UserId.h"
@implementation Notice
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"notice"]){
if([value isKindOfClass:[NSDictionary class]]){
self.notice=[[Notice alloc] init];
[self.notice setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"userId"]){
if([value isKindOfClass:[NSDictionary class]]){
self.userId=[[UserId alloc] init];
[self.userId setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else{
[super setValue:value forKey:key];

}
}@end