#import <Foundation/Foundation.h>
#import "Goods.h"
@interface SalesOrderParts:NSObject
@property(nonatomic,copy)NSString  *unitId;
@property(nonatomic,copy)NSString  *unitName;
@property(nonatomic,copy)NSString  *priceRate;
@property(nonatomic,copy)NSString  *unitPrice;
@property(nonatomic,copy)NSString  *partRecId;
@property(nonatomic,retain)Goods  *goods;
@property(nonatomic,copy)NSString  *billPrice;
@property(nonatomic,copy)NSString  *qtyPlan;
@end