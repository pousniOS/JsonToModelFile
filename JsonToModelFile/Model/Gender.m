#import "Gender.h"
@implementation Gender
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
[super setValue:value forKey:key];

}@end