//
//  FirstOper.h
//  不等
//
//  Created by 中软国际新014 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "First.h"
@interface FirstOper : NSObject
@property FMDatabase * db;
@property First * first;
- (NSMutableArray *)selectallfromNoWait;
- (NSMutableArray *)selectpicfrompicture:(First *)first;
- (int)selectLableColor:(First *)first;
- (void)deletefromNowait:(First *)first;
- (void)updateNowait:(First *)first;
- (First *)selectFirst:(First *)first;
- (void)deletepic:(NSArray *)arr tag:(int)i;
- (void)firstCome;
- (void)updateshoucang:(First *)first shou:(NSNumber* )a;
- (NSArray *)selectshou:(First *)first;
@end
