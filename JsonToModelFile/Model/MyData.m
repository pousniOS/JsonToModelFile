#import "MyData.h"
#import "Title.h"
#import "Content.h"
@implementation MyData
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"title"]){
if([value isKindOfClass:[NSDictionary class]]){
self.title=[[Title alloc] init];
[self.title setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else if([key isEqualToString:@"content"]){
if([value isKindOfClass:[NSDictionary class]]){
self.content=[[Content alloc] init];
[self.content setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else{
[super setValue:value forKey:key];

}
}@end