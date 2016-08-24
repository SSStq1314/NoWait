//
//  Money.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Money.h"

@implementation Money
- (id)initWithMoney:(NSNumber *)money mark:(NSString *)mark date:(NSString *)date type:(NSString *)type{

    if (self = [super init]) {
        _mark = mark;
        _money = money;
        _date = date;
        _type = type;
    }
    return  self;
}
@end
