//
//  Label.m
//  不等
//
//  Created by li on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Label.h"

@implementation Label
-(id)initWithSpotColor:(NSNumber*)spotColor LabelName:(NSString*)labelName{
    if (self=[super init]) {
        _spotColor=spotColor;
        _labelName=labelName;
    }
    return self;
}
@end
