//
//  Content.m
//  不等
//
//  Created by li on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Content.h"

@implementation Content
-(id)initWithWord:(NSString*)word Date:(NSString*)date TextFont:(NSNumber*)textFont BackGround:(NSString*)backGround Label:(NSString*)label ImaArr:(NSArray*)imaArr Weather:(NSString*)weather{
    if (self=[super init]) {
        _word=word;
        _date=date;
        _textFont=textFont;
        _backGround=backGround;
        _label=label;
        _imaArr=imaArr;
        _weather=weather;
    }
    return self;
}
@end
