//
//  monyeOper.h
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "money.h"
@interface monyeOper : NSObject
@property FMDatabase *db;

- (NSArray *)selectAll;
- (void)insert:(Money *)m;
- (void)delete:(NSString *)date;
- (NSNumber *)selecttakein;
- (NSNumber *)selecttakeout;
@end
