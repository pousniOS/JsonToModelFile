#import "SalesRefund.h"
@implementation SalesRefund
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"salesOrderParts"]){
for(id object in value){
self.salesOrderParts=[[NSMutableArray alloc] init];
SalesOrderParts *obj=[[SalesOrderParts alloc] init];
[obj setValuesForKeysWithDictionary:object];
[self.salesOrderParts addObject:obj];
}
}else{
[super setValue:value forKey:key];

}
}@end