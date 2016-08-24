//
//  FirstOper.m
//  不等
//
//  Created by 中软国际新014 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "FirstOper.h"

@implementation FirstOper
- (id)init{
    if (self = [super init]) {
        NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * document = [path objectAtIndex:0];
        NSString * str = [document stringByAppendingPathComponent:@"information.sqlite"];
        _db = [FMDatabase databaseWithPath:str];
    }
    return self;
}

- (void)firstCome{
    
    
        NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * document = [path objectAtIndex:0];
        NSString * str = [document stringByAppendingPathComponent:@"information.sqlite"];
        _db = [FMDatabase databaseWithPath:str];
    
    
    if ([_db open]) {
        [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS content(word text,picid integer PRIMARY KEY,textfont integer,data text,background integer,weather text,label text,shoucang integer DEFAULT 0)"];
        
        [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS label(spotColor integer,labelName text)"];
                
        
        [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS money(money integer,mark text,date text,type text)"];
        
        
        [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS picture(picid integer,picname text)"];
        
        [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS password(pwd text)"];
        
         [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS backpic(backpicid integer PRIMARY KEY,backpicname text)"];
        
        NSString * label = @"日记";
        
        NSNumber * ns = [NSNumber numberWithInt:1];

        [_db executeUpdate:@"insert into label (spotColor,labelName) values(?,?)",ns,label];
        
        NSString * label2 = @"涂鸦";
        
        NSNumber * ns2 = [NSNumber numberWithInt:2];
        
        [_db executeUpdate:@"insert into label (spotColor,labelName) values(?,?)",ns2,label2];
        
        NSString * label3 = @"学习";
        
        NSNumber * ns3 = [NSNumber numberWithInt:3];
        
        [_db executeUpdate:@"insert into label (spotColor,labelName) values(?,?)",ns3,label3];
        NSString* pic=@"IMG_0002.jpg";
        [_db executeUpdate:@"insert into backpic (backpicname) values (?)",pic];


        
        [_db close];
    }
  

    
    
}

- (void)deletepic:(NSArray *)arr tag:(int )i{
    if ([_db open]) {
        NSLog(@"open suc");
    }else{
        NSLog(@"open fail");
    }
    
    BOOL a = [_db executeUpdate:@"delete from picture where picname = ?",arr[i]];
    NSLog(@"%@",arr[i]);
    if (a) {
        NSLog(@"pic delete suc");
    }else{
        NSLog(@"nowait delete fail");
    }
    [_db close];
}
- (NSMutableArray *)selectallfromNoWait{
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    if ([_db open]) {
       
    }else{
        NSLog(@"open fail");
    }
    FMResultSet * set = [_db executeQuery:@"select * from content"];
    while ([set next]) {
        NSString * word = [set stringForColumn:@"word"];
        
        int  picid = [set  intForColumn:@"picid"];
        
        NSString * data = [set stringForColumn:@"data"];
        
        NSString * label = [set stringForColumn:@"label"];
       
        NSNumber * ns = [NSNumber numberWithInt:picid];
        int text = [set intForColumn:@"textfont"];
        NSNumber * te = [NSNumber numberWithInt:text];
        BOOL a = [set boolForColumn:@"shoucang"];
        NSNumber * shou = [NSNumber numberWithBool:a];
        NSString * weather = [set stringForColumn:@"weather"];
        First * f = [[First alloc]initWithWord:word picid:ns Labelcolor:label data:data TextFont:te shoucang:shou Weather:weather];
        [arr addObject:f];
    }
    return arr;
}


- (NSMutableArray *)selectpicfrompicture:(First *)first{
    NSMutableArray * picarr = [[NSMutableArray alloc]init];
    if ([_db open]) {
       
    }else{
        NSLog(@"open fail");
    }
    FMResultSet * set = [_db executeQuery:@"select p.picname from picture p,content n where p.picid = n.picid and n.picid = ?",first.picid];
    while ([set next]) {
        NSString * pic = [set stringForColumn:@"picname"];
        [picarr addObject:pic];
    }
    return picarr;
}

- (int)selectLableColor:(First *)first{
    if ([_db open]) {
       
    }else{
        NSLog(@"open fail");
    }
    int i = 0 ;
    FMResultSet * set = [_db executeQuery:@"select DISTINCT l.spotColor from label l,content n where l.labelName = n.label and n.label = ?",first.labelcolor];
    while ([set next]) {
       i = [set  intForColumn:@"spotColor"];
    }

    return i;
}


- (void)deletefromNowait:(First *)first{
    if ([_db open]) {
        
    }else{
        NSLog(@"open fail");
    }
    BOOL a = [_db executeUpdate:@"delete from content where picid = ?",first.picid];
    BOOL b = [_db executeUpdate:@"delete from picture where picid = ?",first.picid];
    if (a) {
       
    }else{
        NSLog(@"nowait delete fail");
    }
    if (b) {
       
    }else{
        NSLog(@"picture delete fail");
    }
}


- (void)updateNowait:(First *)first{
    if ([_db open]) {
        
    }else{
        NSLog(@"open fail");
    }
    BOOL a = [_db executeUpdate:@"update content set word = ?,textfont = ? where picid = ?",first.word,first.textfont,first.picid];
    if (a) {
        
    }else{
        NSLog(@"content update fail");
    }
}
- (void)updateshoucang:(First *)first shou:(NSNumber* )a{
    if ([_db open]) {
        NSLog(@"shoucang open suc");
    }else{
        NSLog(@"open fail");
    }
    BOOL b = [_db executeUpdate:@"update content set shoucang = ? where picid = ?",a,first.picid];
    if (b) {
        NSLog(@"shoucang content update suc");
    }else{
        NSLog(@"content update fail");
    }
}
- (NSArray *)selectshou:(First *)first{
    NSMutableArray * arr = [NSMutableArray array];
    if ([_db open]) {
        
    }else{
        NSLog(@"open fail");
    }
    FMResultSet * set = [_db executeQuery:@"select * from content where shoucang = 1"];
    while ([set next]) {
        NSString * word = [set stringForColumn:@"word"];
        
        int  picid = [set  intForColumn:@"picid"];
        
        NSString * data = [set stringForColumn:@"data"];
        
        NSString * label = [set stringForColumn:@"label"];
        
        NSNumber * ns = [NSNumber numberWithInt:picid];
        int text = [set intForColumn:@"textfont"];
        NSNumber * te = [NSNumber numberWithInt:text];
        BOOL a = [set boolForColumn:@"shoucang"];
        NSNumber * shou = [NSNumber numberWithBool:a];
        NSString * weather = [set stringForColumn:@"weather"];
        First * f = [[First alloc]initWithWord:word picid:ns Labelcolor:label data:data TextFont:te shoucang:shou Weather:weather];
        [arr addObject:f];
    }
    return arr;
}
- (First *)selectFirst:(First *)first{
    
    
    if ([_db open]) {
        
    }else{
        NSLog(@"open fail");
    }
    FMResultSet * set = [_db executeQuery:@"select * from content where picid = ?",first.picid];
    while ([set next]) {
        NSString * word = [set stringForColumn:@"word"];
        
        int  picid = [set  intForColumn:@"picid"];
        NSString * data = [set stringForColumn:@"data"];
        
        NSString * label = [set stringForColumn:@"label"];
        
        NSNumber * ns = [NSNumber numberWithInt:picid];
        int text = [set intForColumn:@"textfont"];
        NSNumber * te = [NSNumber numberWithInt:text];
        BOOL a = [set boolForColumn:@"shoucang"];
        NSNumber * shou = [NSNumber numberWithBool:a];
        NSString * weather = [set stringForColumn:@"weather"];
        First * f = [[First alloc]initWithWord:word picid:ns Labelcolor:label data:data TextFont:te shoucang:shou Weather:weather];
        return f;
    }
    

    return nil;
}


@end
