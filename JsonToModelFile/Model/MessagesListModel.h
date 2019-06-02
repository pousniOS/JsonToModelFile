#import <Foundation/Foundation.h>
@class Todo;
@class Message;
@class Notice;
@class Shcedule;
@class News;
@interface MessagesListModel:NSObject
@property(nonatomic,retain)Todo  *todo;
@property(nonatomic,retain)Message  *message;
@property(nonatomic,retain)Notice  *notice;
@property(nonatomic,retain)Shcedule  *shcedule;
@property(nonatomic,retain)News  *news;
@end