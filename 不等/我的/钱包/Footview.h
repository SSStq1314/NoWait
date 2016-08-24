//
//  Footview.h
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Footview;
@protocol FootViewDelegate <NSObject>

- (void)footViewUpdata:(Footview *)footview;

@end

@interface Footview : UIView
@property (weak, nonatomic) IBOutlet UILabel *takein;
@property (weak, nonatomic) IBOutlet UILabel *takeout;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (nonatomic,assign) id<FootViewDelegate>delegate;

- (void)show;

@end
