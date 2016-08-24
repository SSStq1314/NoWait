//
//  First.m
//  不等
//
//  Created by 中软国际新014 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "First.h"

@implementation First
- (id)initWithWord:(NSString *)word picid:(NSNumber *)picid Labelcolor:(NSString *)labelcolorcolor data:(NSString *)data TextFont:(NSNumber *)textfont shoucang:(NSNumber *)shoucang Weather:(NSString*)weather{
    if (self = [super init]) {
        _word = word;
        _picid = picid;
        _labelcolor = labelcolorcolor;
        _data = data;
        _textfont = textfont;
        _shoucang = shoucang;
        _weather=weather;
    }
    return self;
}
@end
