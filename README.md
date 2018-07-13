# JsonToModelFile

          我们在做项目的时候经常会遇到要通过网络请求得到的json数据来创建Model类文件，有时得到的json文件可能会比较复杂手动的创建Model
       总感觉费时又费力，例如下面的json数据:
       {
       "salesOrder" : {
       "assistant1" : "xxx",
       "assistantId" : "000001",
       "deliveryType" : "Y",
       "deliveryTypeName" : "送货上门",
       "needInstall" : "Y",
       "orderDate" : "1525507017000",
       "orgId" : "A",
       "orgName" : "xxx有限公司",
       "priceSum" : "3.000000",
       "refundType" : "1",
       "requireArriveDate" : "152559xxx",
       "salesOrderParts" : [
       {
       "billPrice" : "3.00",
       "goods" : {
       "enableSn" : "",
       "giftFlag" : "",
       "goodsTypeName" : "",
       "id" : "",
       "partName" : "豪华电饭煲CFXB50YB8-70//4",
       "pnModel" : "5L",
       "serialRuleId" : ""
       },
       "partRecId" : "01.01.01.400050",
       "priceRate" : "0.000000",
       "qtyPlan" : "1",
       "unitId" : "tai",
       "unitName" : "台",
       "unitPrice" : "3"
       }
       ],
       "subscribeDispatch" : "N",
       "warehouseId" : "1013",
       "warehouseName" : "xxx库"
       },
       "salesRefund" : {
       "assistant1" : "sss",
       "assistantId" : "000001",
       "buyerId" : "QB027",
       "buyerName" : "北xxxx）",
       "orderDate" : "1525507017000",
       "orgId" : "A",
       "orgName" : "xxx有限公司",
       "priceSum" : "3.000000",
       "refundType" : "1",
       "requireArriveDate" : "152559xxxx",
       "salesOrderParts" : [
       {
       "billPrice" : "3.00",
       "goods" : {
       "enableSn" : "",
       "goodsTypeId" : "",
       "goodsTypeName" : "",
       "id" : "",
       "partName" : "xxxCFXB40YB8-70//4",
       "pnModel" : "4L",
       "serialRuleId" : "",
       "unitId" : "",
       "unitName" : ""
       },
       "partRecId" : "01.01.01.400043",
       "priceRate" : "0.000000",
       "qtyPlan" : "1",
       "unitId" : "tai",
       "unitName" : "台",
       "unitPrice" : "3"
       }
       ],
       "warehouseId" : "1011",
       "warehouseName" : "xxx"
       }
       }
       一看就知道我去手动的写Model类好累啊（这一个json文件需要写5个类文件）如果你像我这样通过KVC的方式给对象赋值那么你还得手动的去重写KVC的一
       些方法，所以就在考虑可不可以通过代码自动生成Model文件同时生成需要重写的KVC方法呢？这样就可以节省很多时间在做低级没有技术含量的事情，把更多
       的时间放在有用的地方，于是就有了现在的这个工具"JsonToModelFile"。
       
          JsonToModelFile它需要你给这个josn命名一个“根类”，例如上面的例子我可以命名为“Test”。josn里面会有嵌套的字典和数组他们生成的类的名称
       就是它门key的名称，例如：
       "salesOrderParts" : [
       {
       "billPrice" : "3.00",
       "goods" : {
       "enableSn" : "",
       "goodsTypeId" : "",
       "goodsTypeName" : "",
       "id" : "",
       "partName" : "xxxCFXB40YB8-70//4",
       "pnModel" : "4L",
       "serialRuleId" : "",
       "unitId" : "",
       "unitName" : ""
       },
       "partRecId" : "01.01.01.400043",
       "priceRate" : "0.000000",
       "qtyPlan" : "1",
       "unitId" : "tai",
       "unitName" : "台",
       "unitPrice" : "3"
       }
       ]会生成一个SalesOrderParts名称的Model类，例如：
       "goods" : {
       "enableSn" : "",
       "giftFlag" : "",
       "goodsTypeName" : "",
       "id" : "",
       "partName" : "豪华电饭煲CFXB50YB8-70//4",
       "pnModel" : "5L",
       "serialRuleId" : ""
       }会生成一个Goods名称的Model类。还有你会发现上例子里的json有两个同名的goods他们将会把里面的字段并归到一个Goods类。实际运行结果请看ViewController使用实例。
       
       #import "ViewController.h"
       #import "YYOCLanguage.h"
       @interface ViewController ()
       @end
       @implementation ViewController
       
       - (void)viewDidLoad {
       [super viewDidLoad];
       
       /**填写正确的文件路径**/
       NSString *str=[NSString stringWithContentsOfFile:@"/Users/POSUN/Desktop/TestJson.json" encoding:NSUTF8StringEncoding error:nil];
       
       if (str == nil){return;}
       NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
       NSError *error=nil;
       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
       options:NSJSONReadingMutableContainers
       error:&error];
       /**
       YYOCLOutputFile(className,superClassName,defaultImport,path,dataSource)生成文件，然后到@"/Users/POSUN/Documents/JsonToModelFile/JsonToModelFile/Model"将文件引入项目
       **/
       YYOCLOutputFile(
       @"TEST",//dataSource生成类的类名
       @"NSObject",//父类名称
       @"<Foundation/Foundation.h>",//默认导入的框架
       @"/Users/POSUN/Documents/JsonToModelFile/JsonToModelFile/Model",//生成的类文件保存路径（填写正确的文件路径）
       dic//出入一个NSDictionary
       );
       }
       - (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
       }
       @end
       
       
       
         
