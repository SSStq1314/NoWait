//
//  OperPwd.m
//  不等
//
//  Created by sgsgsg on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "OperPwd.h"

@implementation OperPwd
- (id)init{
    if (self = [super init]) {
        NSArray* path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* docu=[path objectAtIndex:0];
        NSString* str=[docu stringByAppendingPathComponent:@"information.sqlite"];
//        NSLog(@"%@",str);
        _db=[FMDatabase databaseWithPath:str];
    }
    return self;
}
- (void)inserPwd:(NSString *)p{
    if ([_db open]) {
        [_db executeUpdate:@"insert into password values (?) ",p];
    }
    [_db close];
}
- (void)deletePwd{
    if ([_db open]) {
        [_db executeUpdate:@"delete from password"];
    }
    [_db close];
}

- (NSString *)select{
    NSString *pwd;
    if ([_db open]) {
        FMResultSet *set = [_db executeQuery:@"select * from password"];
        if ([set next]) {
            pwd = [set stringForColumn:@"pwd"];
        }
    }
    [_db close];
    return pwd;
}
@end
