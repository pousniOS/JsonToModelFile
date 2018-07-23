//
//  YYOCLanguage.h
//  Test
//
//  Created by POSUN-MAC on 2018/7/12.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**可以通过宏的方式生成**/
#define YYOCLOutputFile(className,superClassName,defaultImport,path,dataSource) [[YYOCLanguage share] outputClass:className andSuperClass:superClassName andDefaultImport:defaultImport andSavePath:path fromDataSource:dataSource]
@interface YYOCLanguage : NSObject

+(instancetype)share;
/**
 用于输出通过dataSource生成的类文件，
 该方法会判断文件是否存在如果存在将不生
 成改文件
 **/
-(void)outputClass:(NSString *)className andSuperClass:(NSString *)superClassName andDefaultImport:(NSString *)name andSavePath:(NSString *)path fromDataSource:(id)dataSource;
@end
