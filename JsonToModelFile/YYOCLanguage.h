//
//  YYOCLanguage.h
//  Test
//
//  Created by POSUN-MAC on 2018/7/12.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYOCLanguage : NSObject
@property(nonatomic,copy)NSString *importClassName;//引入的框架
@property(nonatomic,copy)NSString *superClassName;//父类名称
@property(nonatomic,copy)NSString *className;//类名称
@property(nonatomic,copy)NSString *path;

@property(nonatomic,retain)id dataSource;//数据源



@property(nonatomic,copy,readonly)NSString *KVCmethod;


@property(nonatomic,retain,readonly)NSMutableDictionary *classInforDic;
@property(nonatomic,retain,readonly)NSMutableString *ocll;


+(instancetype)share;
-(void)reset;
-(void)outputFile;

-(YYOCLanguage *)classHStr:(NSDictionary *)dic andClassName:(NSString *)className;
-(YYOCLanguage *)classMStr:(NSDictionary *)dic andClassName:(NSString *)className;


-(YYOCLanguage*(^)(NSString *className))import;
-(YYOCLanguage*)semicolon;
-(YYOCLanguage*(^)(NSString *className,NSString *superClassName))interface;
-(YYOCLanguage*(^)(NSString *className))implementation;
- (YYOCLanguage * (^)(NSString *keyName,...))property;
-(YYOCLanguage*(^)(NSString *typeName))Type;
-(YYOCLanguage*(^)(NSString *propertyName))propertyName;
-(YYOCLanguage*(^)(NSString *methodName))methodName;
-(YYOCLanguage*(^)(YYOCLanguage *imp))imp;
-(YYOCLanguage*(^)(NSString *condition))FOR;
-(YYOCLanguage*(^)(NSString *condition))IF;
-(YYOCLanguage*(^)(NSString *code))code;
-(YYOCLanguage *)star;
-(YYOCLanguage*)ELSE;
-(YYOCLanguage*(^)(NSString *condition))ELSE_IF;
-(YYOCLanguage*)end;
@end
