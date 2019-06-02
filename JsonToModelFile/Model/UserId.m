#import "UserId.h"
#import "Gender.h"
@implementation UserId
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"gender"]){
if([value isKindOfClass:[NSDictionary class]]){
self.gender=[[Gender alloc] init];
[self.gender setValuesForKeysWithDictionary:value];
}else{
[super setValue:value forKey:key];

}
}else{
[super setValue:value forKey:key];

}
}@end