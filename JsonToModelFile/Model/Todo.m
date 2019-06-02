#import "Todo.h"
#import "MyData.h"
#import "Data.h"
#import "Todo.h"
@implementation Todo
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"UndefinedKey:%@",key);
};
-(void)setValue:(id)value forKey:(NSString *)key{
    if([key isEqualToString:@"myData"]){
        if([value isKindOfClass:[NSDictionary class]]){
            self.myData=[[MyData alloc] init];
            [self.myData setValuesForKeysWithDictionary:value];
        }else{
            [super setValue:value forKey:key];
            
        }
    }else if([key isEqualToString:@"data"]){
        self.data=[[NSMutableArray alloc] init];
        for(id object in value){
            if([value isKindOfClass:[NSDictionary class]]){
                Data *obj=[[Data alloc] init];
                [obj setValuesForKeysWithDictionary:object];
                [self.data addObject:obj];
            }else{
                [self.data addObject:value];
            }
        }
    }else if([key isEqualToString:@"todo"]){
        if([value isKindOfClass:[NSDictionary class]]){
            self.todo=[[Todo alloc] init];
            [self.todo setValuesForKeysWithDictionary:value];
        }else{
            [super setValue:value forKey:key];
            
        }
    }else{
        [super setValue:value forKey:key];
        
    }
}@end

