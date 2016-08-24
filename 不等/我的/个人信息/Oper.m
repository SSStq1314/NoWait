//
//  Oper.m
//  不等
//
//  Created by li on 16/5/27.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Oper.h"

@implementation Oper
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray* path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* docu=[path objectAtIndex:0];
        NSString* str=[docu stringByAppendingPathComponent:@"information.sqlite"];
        NSLog(@"%@",str);
        _aa=[FMDatabase databaseWithPath:str];
    }
    return self;
}
-(NSString*)selePic{
    NSString* str=[[NSString alloc]init];
    if ([_aa open]) {
        FMResultSet* set=[_aa executeQuery:@"select backpicname from backpic"];
        if ([set next]) {
            str=[set stringForColumn:@"backpicname"];
        }
    }
    [_aa close];
    return str;
}
-(void)updatePic:(NSString*)str{
    if ([_aa open]) {
        [_aa executeUpdate:@"update backpic set backpicname=?",str];
    }
    [_aa close];
}
@end
