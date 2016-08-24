//
//  passDl.m
//  不等
//
//  Created by li on 16/5/26.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "passDl.h"
static passDl* op;
@implementation passDl
+(id)passDlInstance{
    if (op==nil) {
        op=[[passDl alloc]init];
    }
    return op;
}
@end
