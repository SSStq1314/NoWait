//
//  Anniudanli.m
//  不等
//
//  Created by 中软国际新014 on 16/5/25.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Anniudanli.h"
static Anniudanli * adanli;
@implementation Anniudanli

+ (instancetype)anniudanli{
    if (adanli == nil) {
        adanli = [[Anniudanli alloc]init];
    }
    return adanli;
}
@end
