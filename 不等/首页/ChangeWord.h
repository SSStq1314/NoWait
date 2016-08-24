//
//  ChangeWord.h
//  不等
//
//  Created by ssstq1314 on 16/5/26.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChangeWord;
@protocol ChangeWordDelegat <NSObject>

- (void)changeTextSize:(ChangeWord *)changeWord;

@end

@interface ChangeWord : UIView
@property (weak, nonatomic) IBOutlet UILabel *wordSize;
@property (weak, nonatomic) IBOutlet UILabel *size;
@property (weak, nonatomic) IBOutlet UILabel *minSize;
@property (weak, nonatomic) IBOutlet UILabel *maxSize;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property(nonatomic,weak)id<ChangeWordDelegat> delegate;

- (IBAction)changeWordSize:(UISlider *)sender;

@end
