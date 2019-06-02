#import <Foundation/Foundation.h>
@class Title;
@class Content;
@interface MyData:NSObject
@property(nonatomic,retain)Title  *title;
@property(nonatomic,retain)Content  *content;
@end