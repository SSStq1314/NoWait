//
//  SpotDl.m
//  不等
//
//  Created by li on 16/5/19.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "SpotDl.h"
static SpotDl* d;
@implementation SpotDl
+(id)spotDlInstance{
    if (d==nil) {
        d=[[SpotDl alloc]init];
    }
    return d;
}
@end
