//
//  ViewController.m
//  JsonToModelFile
//
//  Created by POSUN-MAC on 2018/7/12.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import "ViewController.h"
#import "YYOCLanguage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str=[NSString stringWithContentsOfFile:@"/Users/POSUN/Desktop/mybookingprod.json" encoding:NSUTF8StringEncoding error:nil];
    
    if (str == nil){return;}
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error=nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    
    
    
    


    
    YYOCLOutputFile(
                    @"TEST",//dataSource生成类的类名
                    @"NSObject",//父类名称
                    @"<Foundation/Foundation.h>",//默认导入的框架
                    @"/Users/POSUN/Desktop/Test/Test/Model",//生成的类文件保存路径
                    dic//出入一个NSDictionary
                    );
    
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
