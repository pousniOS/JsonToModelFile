#import "Goods.h"
@implementation Goods
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
[super setValue:value forKey:key];

}@end