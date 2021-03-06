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
    /**填写正确的文件路径**/
    NSString *str=[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TestJson.json" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    if (str == nil){return;}
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error=nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    /**
     YYOCLOutputFile(className,superClassName,defaultImport,path,dataSource)生成文件，然后到@"/Users/POSUN/Documents/JsonToModelFile/JsonToModelFile/Model"将文件引入项目

     注意：请删除Model文件夹下的类在运行代码
     **/
    
    YYOCLOutputFile(@"MessagesListModel", @"NSObject", @"<Foundation/Foundation.h>", @"/Users/apple/Documents/JsonToModelFile/JsonToModelFile/Model", YES, dic);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
