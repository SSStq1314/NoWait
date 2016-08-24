//
//  ChangeWord.m
//  不等
//
//  Created by ssstq1314 on 16/5/26.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "ChangeWord.h"
#import "FirstOper.h"
#import "FirstDanLi.h"
#import "First.h"

@implementation ChangeWord

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (IBAction)changeWordSize:(UISlider *)sender {
    

    FirstDanLi * danli = [FirstDanLi firstdanli];
    First * first = danli.first;
    first.textfont = [NSNumber numberWithFloat:sender.value];
    danli.first = first;
    self.wordSize.text = [NSString stringWithFormat:@"%d",(int)sender.value];
    
    
    [self.delegate changeTextSize:self];
    
    
    
    
   
    
}




@end
