#import <Foundation/Foundation.h>
#import "SalesOrder.h"
#import "SalesRefund.h"
@interface TEST:NSObject
@property(nonatomic,copy)NSString  *ID;
@property(nonatomic,retain)SalesOrder  *salesOrder;
@property(nonatomic,retain)SalesRefund  *salesRefund;
@end