//
//  FirstDanLi.m
//  不等
//
//  Created by 中软国际新014 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "FirstDanLi.h"
static FirstDanLi * danli;
@implementation FirstDanLi
+(instancetype)firstdanli{
    if (danli == nil) {
        danli = [[FirstDanLi alloc]init];
    }
    return danli;
}
@end
