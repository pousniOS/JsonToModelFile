#import "SalesOrder.h"
@implementation SalesOrder
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
if([key isEqualToString:@"salesOrderParts"]){
self.salesOrderParts=[[NSMutableArray alloc] init];
for(id object in value){
SalesOrderParts *obj=[[SalesOrderParts alloc] init];
[obj setValuesForKeysWithDictionary:object];
[self.salesOrderParts addObject:obj];
}
}else{
[super setValue:value forKey:key];

}
}@end