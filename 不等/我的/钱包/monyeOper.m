//
//  monyeOper.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "monyeOper.h"

@implementation monyeOper

- (id)init{
    if (self = [super init]) {
        NSArray* path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* docu=[path objectAtIndex:0];
        NSString* str=[docu stringByAppendingPathComponent:@"information.sqlite"];
        NSLog(@"%@",str);
        _db=[FMDatabase databaseWithPath:str];
    }
    
    return self;
}

- (NSArray *)selectAll{
    
    NSMutableArray *arr = [NSMutableArray array];
    if ([_db open]) {
        FMResultSet *set = [_db executeQuery:@"select * from money"];
        while ([set next]) {
            float money = [set doubleForColumn:@"money"];
            NSString *type = [set stringForColumn:@"type"];
            NSString *mark = [set stringForColumn:@"mark"];
            NSString *date = [set stringForColumn:@"date"];
            Money *m = [[Money alloc]initWithMoney:[NSNumber numberWithFloat:money] mark:mark date:date type:type];
            [arr addObject:m];
        }
    }
    
    
    [_db close];
    return arr;

}

- (void)insert:(Money *)m{
    [_db open];
    BOOL b = [_db executeUpdate:@"insert into money values(?,?,?,?)",m.money,m.mark,m.date,m.type];
    if (b) {
        [_db close];
    }else{
        NSLog(@"fail");
    }
}

- (void)delete:(NSString *)date{
    [_db open];
    BOOL b = [_db executeUpdate:@"delete from money where date = ?",date];
    if (b) {
        [_db close];
    }else{
        NSLog(@"fail");
    }
}

- (NSNumber *)selecttakein{

    [_db open];
    float a = 0;
    FMResultSet *set = [_db executeQuery:@"select money from money where type = '收入'"];
    while ([set next]) {
        float money = [set doubleForColumn:@"money"];
        a = a + money;
    }
    NSNumber *b = [NSNumber numberWithFloat:a];
    return b;
}
- (NSNumber *)selecttakeout{

    [_db open];
    float a = 0;
    FMResultSet *set = [_db executeQuery:@"select money from money where type = '支出'"];
    while ([set next]) {
        float money = [set doubleForColumn:@"money"];
        a = a + money;
    }
    NSNumber *b = [NSNumber numberWithFloat:a];
    return b;
}

@end
