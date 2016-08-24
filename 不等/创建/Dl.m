//
//  Dl.m
//  不等
//
//  Created by li on 16/5/19.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Dl.h"
static Dl* d;
@implementation Dl
+(id)DlInstance{
    if (d==nil) {
        d=[[Dl alloc]init];
    }
    return d;
}
@end
