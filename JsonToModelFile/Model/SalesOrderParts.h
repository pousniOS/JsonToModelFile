#import <Foundation/Foundation.h>
#import "Goods.h"
@interface SalesOrderParts:NSObject
@property(nonatomic,retain)Goods  *goods;
@property(nonatomic,copy)NSString  *partRecId;
@end