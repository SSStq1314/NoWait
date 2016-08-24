//
//  imageDl.m
//  不等
//
//  Created by li on 16/5/28.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "imageDl.h"
static imageDl* op;
@implementation imageDl
+(id)imageDlInstance{
    if (op==nil) {
        op=[[imageDl alloc]init];
    }
    return op;
}
@end
