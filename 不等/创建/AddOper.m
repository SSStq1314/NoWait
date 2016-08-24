//
//  AddOper.m
//  不等
//
//  Created by li on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "AddOper.h"
#import "Label.h"
@implementation AddOper
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

-(NSMutableArray*)labelAll{
    NSMutableArray* arr=[[NSMutableArray alloc]init];
    if ([_aa open]) {
        FMResultSet* set=[_aa executeQuery:@"select * from label"];
        while ([set next]) {
            int a=[set intForColumn:@"spotColor"];
            Label* la=[[Label alloc]initWithSpotColor:[NSNumber numberWithInt:a] LabelName:[set stringForColumn:@"labelName"]];
            [arr addObject:la];
        }
    }
    [_aa close];
    return arr;
}
-(void)dele:(NSString*)labelName{
    if ([_aa open]) {
        [_aa executeUpdate:@"delete from label where labelName=?",labelName];
    }
    [_aa close];
}
-(void)inse:(Label*)la{
    if ([_aa open]) {
        [_aa executeUpdate:@"insert into label (spotColor,labelName) values(?,?)",la.spotColor,la.labelName];
    }
    [_aa close];
}
-(void)update:(Label*)la{
    if ([_aa open]) {
        [_aa executeUpdate:@"update label set spotColor=? where labelName=?",la.spotColor,la.labelName];
    }
    [_aa close];
}
-(BOOL)inseContent:(Content*)con{
    BOOL b;
    if ([_aa open]) {
        b=[_aa executeUpdate:@"insert into content(word,data,textfont,background,label,weather) values (?,?,?,?,?,?)",con.word,con.date,con.textFont,con.backGround,con.label,con.weather];
        int picid=[self selepic];
        if (con.imaArr.count == 0) {
            [_aa executeUpdate:@"insert into picture(picid) values (?,?)",[NSNumber numberWithInt:picid],nil];
        }else{
            for (int i=0; i<con.imaArr.count; i++) {
                [_aa executeUpdate:@"insert into picture values (?,?)",[NSNumber numberWithInt:picid],con.imaArr[i]];
            }
        }
    }
    [_aa close];
    return b;
}
-(int)selepic{
    int a = 0;
    FMResultSet* set=[_aa executeQuery:@"select picid from content"];
    while ([set next]) {
        a=[set intForColumn:@"picid"];
    }
    return a;
}
@end
