//
//  LabelDl.m
//  不等
//
//  Created by li on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "LabelDl.h"
static LabelDl* d;
@implementation LabelDl
+(id)labelDlInstance{
    if (d==nil) {
        d=[[LabelDl alloc]init];
    }
    return d;
}
@end
