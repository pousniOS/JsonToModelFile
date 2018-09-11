//
//  YYOCLanguage.m
//  Test
//
//  Created by POSUN-MAC on 2018/7/12.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//
#import "YYOCLanguage.h"
static NSString *const OCL_import=@"#import";
static NSString *const OCL_interface=@"@interface";
static NSString *const OCL_end=@"@end";
static NSString *const OCL_implementation=@"@implementation";
static NSString *const OCL_property=@"@property";
static NSString *const OCL_copy=@"copy";
static NSString *const OCL_assign=@"assign";
static NSString *const OCL_retain=@"retain";
static NSString *const OCL_nonatomic=@"nonatomic";
static NSString *const OCL_for=@"for";
static NSString *const OCL_if=@"if";
static NSString *const OCL_else=@"else";
static NSString *const OCL_else_if=@"else if";
static NSString *const OCL_semicolon=@";\n";

static NSString *const OCL_Type=@"Type";
static NSString *const OCL_Class=@"Class";
static NSString *const OCL_NSDictionary=@"NSDictionary";
static NSString *const OCL_NSNumber=@"NSNumber";
static NSString *const OCL_NSString=@"NSString";
static NSString *const OCL_NSArray=@"NSArray";
static NSString *const OCL_NSMutableArray=@"NSMutableArray";
static NSString *const OCL_ClassName=@"className";
static NSString *const OCL_Star=@"*";
#define oclanguage [[YYOCLanguage alloc] init]

@interface YYOCLanguage(){
    NSMutableDictionary *_classInforDic;
}
@property(nonatomic,retain)NSMutableString *OCLL;
@property(nonatomic,copy)NSString *defaultImport;//引入的框架
@property(nonatomic,copy)NSString *superClassName;//父类名称
@property(nonatomic,copy)NSString *className;//类名称
@property(nonatomic,copy)NSString *savePath;//生成的文件的保存路径
@property(nonatomic,retain)id dataSource;//数据源

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


@implementation YYOCLanguage
-(instancetype)init{
    if (self=[super init]) {
        self.OCLL=[[NSMutableString alloc] init];
    }
    return self;
}

+(instancetype)share{
    static YYOCLanguage *yyOCLanguage=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yyOCLanguage=[[YYOCLanguage alloc] init];
    });
    return yyOCLanguage;
}
-(void)reset{
    self.OCLL=[[NSMutableString alloc] init];
}
-(YYOCLanguage*(^)(NSString *className))import{
    return ^YYOCLanguage*(NSString *className){
        [self.OCLL appendString:OCL_import];
        [self.OCLL appendString:@" "];
        [self.OCLL appendString:className];
        [self.OCLL appendString:@"\n"];
        return self;
    };
}
-(YYOCLanguage*)semicolon{
    [self.OCLL appendString:OCL_semicolon];
    return self;
}

-(YYOCLanguage*(^)(NSString *className,NSString *superClassName))interface{
    return ^YYOCLanguage*(NSString *className,NSString *superClassName){
        [self.OCLL appendString:OCL_interface];
        [self.OCLL appendString:@" "];
        [self.OCLL appendString:className];
        [self.OCLL appendString:@":"];
        [self.OCLL appendString:superClassName];
        [self.OCLL appendString:@"\n"];
        return self;
    };
}

-(YYOCLanguage*(^)(NSString *className))implementation{
    return ^YYOCLanguage*(NSString *className){
        [self.OCLL appendString:OCL_implementation];
        [self.OCLL appendString:@" "];
        [self.OCLL appendString:className];
        [self.OCLL appendString:@"\n"];

        return self;
    };
}
- (YYOCLanguage * (^)(NSString *keyName,...))property{
    return ^YYOCLanguage *(NSString *keyName,...){
        NSMutableArray *array = [NSMutableArray array];
        if (keyName){
            va_list argsList;
            [array addObject:keyName];
            va_start(argsList, keyName);
            id arg;
            while ((arg = va_arg(argsList, id))){
                [array addObject:arg];
            }
            va_end(argsList);
        }
        [self.OCLL appendString:[NSString stringWithFormat:@"%@(%@)",OCL_property,[array componentsJoinedByString:@","]]];
        return self;
    };
}
-(YYOCLanguage*(^)(NSString *typeName))Type{
    return ^YYOCLanguage*(NSString *typeName){
        [self.OCLL appendString:typeName];
        [self.OCLL appendString:@" "];
        return self;
    };
}
-(YYOCLanguage*(^)(NSString *propertyName))propertyName{
    return ^YYOCLanguage*(NSString *propertyName){
        [self.OCLL appendString:propertyName];
        return self;
    };
}
-(YYOCLanguage*(^)(NSString *methodName))methodName{
    return ^YYOCLanguage*(NSString *methodName){
        [self.OCLL appendString:methodName];
        return self;
    };
}
-(YYOCLanguage*(^)(YYOCLanguage *imp))imp{
    return ^YYOCLanguage*(YYOCLanguage *imp){
        [self.OCLL appendString:@"{\n"];
        [self.OCLL appendString:imp.OCLL];
        [self.OCLL appendString:@"\n}"];
        return self;
    };
}
-(YYOCLanguage*(^)(NSString *condition))FOR{
    return ^YYOCLanguage*(NSString *condition){
        
        [self.OCLL appendString:OCL_for];
        [self.OCLL appendString:@"("];
        [self.OCLL appendString:condition];
        [self.OCLL appendString:@")"];
        return self;
    };
}
-(YYOCLanguage*(^)(NSString *condition))IF{
    return ^YYOCLanguage*(NSString *condition){
        [self.OCLL appendString:OCL_if];
        [self.OCLL appendString:@"("];
        [self.OCLL appendString:condition];
        [self.OCLL appendString:@")"];
        return self;
    };
}

-(YYOCLanguage*(^)(NSString *code))code{
    return ^YYOCLanguage*(NSString *code){
        [self.OCLL appendString:code];
        return self;
    };
}

-(YYOCLanguage*)ELSE{
    [self.OCLL appendString:OCL_else];
    return self;
}
-(YYOCLanguage *)star{
    [self.OCLL appendString:@" "];
    [self.OCLL appendString:OCL_Star];
    return self;
}
-(YYOCLanguage*(^)(NSString *condition))ELSE_IF{
    return ^YYOCLanguage*(NSString *condition){
        [self.OCLL appendString:OCL_else_if];
        [self.OCLL appendString:@"("];
        [self.OCLL appendString:condition];
        [self.OCLL appendString:@")"];
        return self;
    };
}
-(YYOCLanguage*)end{
    [self.OCLL appendString:OCL_end];
    return self;
}
-(BOOL)isNeedImportClass:(NSString *)className{
    if (![className isEqualToString:OCL_NSString]&&
        ![className isEqualToString:OCL_NSDictionary]&&
        ![className isEqualToString:OCL_NSArray]&&
        ![className isEqualToString:OCL_NSMutableArray]&&
        ![className isEqualToString:OCL_NSNumber]
        ) {
        return YES;
    }else{
        return NO;
    }
}

/**
 构建类的头文件（.h）的代码
 **/
-(YYOCLanguage *)classHStr:(NSDictionary *)dic andClassName:(NSString *)className{
    [self reset];
    self.import(_defaultImport);
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([self isNeedImportClass:obj[OCL_Class]]) {
            self.import([NSString stringWithFormat:@"\"%@.h\"",obj[OCL_Class]]);
        }
    }];
    self.interface(className,_superClassName);
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([key isEqualToString:@"id"]) {
            key=@"Id";
        }
        
        if ([obj[OCL_Type] isEqualToString:OCL_NSMutableArray]||[obj[OCL_Type] isEqualToString:OCL_NSArray]) {
            [self.property(OCL_nonatomic,OCL_retain,nil).Type(obj[OCL_Type]).star.propertyName(key) semicolon];
        }
        else if ([obj[OCL_Type] isEqualToString:OCL_NSString]){
            [self.property(OCL_nonatomic,OCL_copy,nil).Type(obj[OCL_Type]).star.propertyName(key) semicolon];
        }
        else{
            [self.property(OCL_nonatomic,OCL_retain,nil).Type(obj[OCL_Class]).star.propertyName(key) semicolon];
        }
    }];
    [self end];
    return self;
}

/**
 构建类的实现文件（.m）的代码
 **/
-(YYOCLanguage *)classMStr:(NSDictionary *)dic andClassName:(NSString *)className{
    [self reset];
    
    self.import([NSString stringWithFormat:@"\"%@.h\"",className]);
    
    self.implementation(className);
    self.code([self KVCmethodsStr:dic].OCLL);
    [self end];
    return self;
}

/**
 生成类的KVC方法目的是方便使用
 setValuesForKeysWithDictionary
 对类创建的对象赋值
 **/
-(YYOCLanguage *)KVCmethodsStr:(NSDictionary*)dic{
    YYOCLanguage *OCLanguage=[[YYOCLanguage alloc] init];
    [OCLanguage.methodName(@"-(void)setValue:(id)value forUndefinedKey:(NSString *)key").imp
     (
      oclanguage.code(@"NSLog(@\"UndefinedKey:%@\",key);")
      )
     semicolon];
    
    
    YYOCLanguage *ocl=[[YYOCLanguage alloc] init];
    __block BOOL flag=NO;
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"id"]) {
            key=@"Id";
        }
        
        NSString *type=obj[OCL_Type];
        NSString *class=obj[OCL_Class];
        
        if ([key isEqualToString:@"id"]) {
            ocl.IF([NSString stringWithFormat:@"[key isEqualToString:@\"id\"]"]).imp(
                                                                                     oclanguage.code(@"[super setValue:value forKey:Id];\n")
                                                                                     );
        }
        if ([type isEqualToString:OCL_NSDictionary]) {
            
            NSMutableArray *subArr=[[NSMutableArray alloc] init];
            [subArr addObject:[NSString stringWithFormat:@"self.%@=[[%@ alloc] init];",key,class]];
            [subArr addObject:[NSString stringWithFormat:@"[self.%@ setValuesForKeysWithDictionary:value];",key]];
            
            if (flag) {
                ocl.ELSE_IF([NSString stringWithFormat:@"[key isEqualToString:@\"%@\"]",key]);
            }else{
                ocl.IF([NSString stringWithFormat:@"[key isEqualToString:@\"%@\"]",key]);
            }
            ocl.imp(
                     oclanguage.code([subArr componentsJoinedByString:@"\n"])
                     );
            flag=YES;
        }
        else if ([type isEqualToString:OCL_NSArray]||[type isEqualToString:OCL_NSMutableArray]){
            NSMutableArray *subArr=[[NSMutableArray alloc] init];
            NSString *objectName=@"obj";
//            [subArr addObject:[NSString stringWithFormat:@"self.%@=[[%@ alloc] init];",key,OCL_NSMutableArray]];
            [subArr addObject:[NSString stringWithFormat:@"%@ *%@=[[%@ alloc] init];",class,objectName,class]];
            [subArr addObject:[NSString stringWithFormat:@"[%@ setValuesForKeysWithDictionary:object];",objectName]];
            [subArr addObject:[NSString stringWithFormat:@"[self.%@ addObject:%@];",key,objectName]];
            
            if (flag) {
                ocl.ELSE_IF([NSString stringWithFormat:@"[key isEqualToString:@\"%@\"]",key]);
            }else{
                ocl.IF([NSString stringWithFormat:@"[key isEqualToString:@\"%@\"]",key]);
            }
            ocl.imp(
                    oclanguage.code([NSString stringWithFormat:@"self.%@=[[%@ alloc] init];\n",key,OCL_NSMutableArray]).FOR(@"id object in value")
                    .imp(
                         oclanguage.code([subArr componentsJoinedByString:@"\n"])
                         )
                    );
            flag=YES;
        }
    }];

    if (flag) {
        ocl.ELSE.
        imp(
            oclanguage.code(@"[super setValue:value forKey:key];\n")
            );
    }else{
        ocl.code(@"[super setValue:value forKey:key];\n");
    }
    
    OCLanguage.methodName(@"-(void)setValue:(id)value forKey:(NSString *)key").imp
    (
     ocl
     );
    return OCLanguage;
}
/**通过object构建出一个
 
         @{
           @"className":@{
                   @"propertyName1":@{//属性名
                           @"Type":@"type1",//属性来源类型
                           @"Class":@"class1"//属性应属于类型
                           },
                   @"propertyName3":@{
                           @"Type":@"type2",
                           @"Class":@"class2"
 
                           }
                   },
           @"className1":@{
                   @"propertyName1":@{
                           @"Type":@"type1",
                           @"Class":@"class1"
                           },
                   @"propertyName3":@{
                           @"Type":@"type2",
                           @"Class":@"class2"
 
                           }
                   }
           ......
           }
 的类信息字典
 **/
-(void )bulidClassInfor:(id)object andClassName:(NSString *)className{
    className=[self firstCharUppercaseString:className];
    
    if([object isKindOfClass:[NSArray class]]){
        NSArray *arr=(NSArray *)object;
        if (arr.count){
            [self bulidClassInfor:[arr firstObject] andClassName:className];
        }
        else{}
    }
    else if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary *dic=[object mutableCopy];
        NSArray *keyArray= [dic allKeys];
        for (NSInteger i=0; i<keyArray.count; i++){
            NSString *key=keyArray[i];
            id value=dic[key];
            if ([value isKindOfClass:[NSArray class]]){
                if ([object[key] count]){
                    
                    NSString *name=[self firstCharUppercaseString:key];
                    [self bulidClassInfor:object[key][0] andClassName:name];
                    NSDictionary *subDic=@{
                                           OCL_Type:OCL_NSMutableArray,
                                           OCL_Class:name
                                           };
                    [dic setValue:subDic forKey:key];
                }
                else{}
            }
            else if ([value isKindOfClass:[NSDictionary class]]){
                NSString *name=[self firstCharUppercaseString:key];
                NSDictionary *subDic=@{
                                       OCL_Type:OCL_NSDictionary,
                                       OCL_Class:name
                                       };
                [dic setValue:subDic forKey:key];
                [self bulidClassInfor:object[key] andClassName:name];
                
            }
            else if ([value isKindOfClass:[NSNumber class]]){
                NSDictionary *subDic=@{
                                       OCL_Type:OCL_NSNumber,
                                       OCL_Class:OCL_NSNumber
                                       };
                [dic setValue:subDic forKey:key];
            }
            else{
                NSDictionary *subDic=@{
                                       OCL_Type:OCL_NSString,
                                       OCL_Class:OCL_NSString
                                       };
                [dic setValue:subDic forKey:key];
            }
        }
        if (_classInforDic[className]) {
            NSMutableDictionary *value =_classInforDic[className];
            NSArray *keyArray= [dic allKeys];
            for (NSInteger i=0; i<keyArray.count; i++){
                NSString *key=keyArray[i];
                [value setObject:dic[key] forKey:key];
            }
        }else{
            [_classInforDic setValue:dic forKey:className];
        }
    }
    else{}
}
-(void)setDataSource:(id)dataSource{
    _dataSource=dataSource;
    _classInforDic=[[NSMutableDictionary alloc] init];
    [self bulidClassInfor:_dataSource andClassName:_className];
}
-(void)outputClass:(NSString *)className andSuperClass:(NSString *)superClassName andDefaultImport:(NSString *)name andSavePath:(NSString *)path fromDataSource:(id)dataSource{
    
    if (name.length==0||
        className.length==0||
        superClassName.length==0||
        path.length==0||
        dataSource==nil) {
        NSLog(@"defaultImport、className、superClassName、dataSource、savePath都不能为空");
        return;
    }
   
    
    self.defaultImport=name;
    self.className=className;
    self.superClassName=superClassName;
    self.savePath=path;
    self.dataSource=dataSource;
    [self outputFile];
}
-(void)outputFile{
    [_classInforDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self bulidFile:[self classHStr:obj andClassName:key].OCLL andFileName:[NSString stringWithFormat:@"%@/%@.h",self.savePath,key]];
        [self bulidFile:[self classMStr:obj andClassName:key].OCLL andFileName:[NSString stringWithFormat:@"%@/%@.m",self.savePath,key]];
    }];
}

-(BOOL)bulidFile:(NSString *)content andFileName:(NSString *)fileName{
    NSError *error=nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:fileName]){return YES;}
    [fileManager createFileAtPath:fileName contents:nil attributes:nil];
    [content writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error){
        return NO;
    }
    else{
        return YES;
    }
}
-(NSString *)firstCharUppercaseString:(NSString *)name{
    NSString *firstStr=nil;
    NSString *lastStr=nil;
    if (name.length>0) {
        firstStr=[name substringToIndex:1];
        lastStr=[name substringFromIndex:1];
        return [NSString stringWithFormat:@"%@%@",[firstStr uppercaseString],lastStr];
    }
    return name;
}
@end
