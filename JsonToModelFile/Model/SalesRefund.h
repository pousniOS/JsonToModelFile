#import <Foundation/Foundation.h>
#import "SalesOrderParts.h"
@interface SalesRefund:NSObject
@property(nonatomic,copy)NSString  *orderDate;
@property(nonatomic,copy)NSString  *buyerId;
@property(nonatomic,copy)NSString  *requireArriveDate;
@property(nonatomic,copy)NSString  *refundType;
@property(nonatomic,retain)NSMutableArray  *salesOrderParts;
@property(nonatomic,copy)NSString  *assistantId;
@property(nonatomic,copy)NSString  *warehouseId;
@property(nonatomic,copy)NSString  *assistant1;
@property(nonatomic,copy)NSString  *buyerName;
@property(nonatomic,copy)NSString  *orgId;
@property(nonatomic,copy)NSString  *warehouseName;
@property(nonatomic,copy)NSString  *orgName;
@property(nonatomic,copy)NSString  *priceSum;
@end