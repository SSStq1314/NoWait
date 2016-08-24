//
//  Footview.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Footview.h"
#import "monyeOper.h"
@implementation Footview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)show{
monyeOper *mo = [[monyeOper alloc]init];

self.takein.text = [NSString stringWithFormat:@"%@",[mo selecttakein]];

self.takeout.text = [NSString stringWithFormat:@"%@",[mo selecttakeout]];
self.result.text = [NSString stringWithFormat:@"%d",([[mo selecttakein] intValue] -[[mo selecttakeout] intValue])];
}

@end
