#import <Foundation/Foundation.h>
#import "SalesOrderParts.h"
@interface SalesOrder:NSObject
@property(nonatomic,copy)NSString  *assistant1;
@property(nonatomic,retain)NSMutableArray  *salesOrderParts;
@end