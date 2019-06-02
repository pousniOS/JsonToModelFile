#import "MessagesListModel.h"
#import "Todo.h"
#import "Message.h"
#import "Notice.h"
#import "Shcedule.h"
#import "News.h"
@implementation MessagesListModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"todo"]){
if([value isKindOfClass:[NSDictionary class]]){
self.todo=[[Todo alloc] init];
[self.todo setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"message"]){
if([value isKindOfClass:[NSDictionary class]]){
self.message=[[Message alloc] init];
[self.message setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"notice"]){
if([value isKindOfClass:[NSDictionary class]]){
self.notice=[[Notice alloc] init];
[self.notice setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"shcedule"]){
if([value isKindOfClass:[NSDictionary class]]){
self.shcedule=[[Shcedule alloc] init];
[self.shcedule setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"news"]){
if([value isKindOfClass:[NSDictionary class]]){
self.news=[[News alloc] init];
[self.news setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else{
[super setValue:value forKey:key];

}
}@end