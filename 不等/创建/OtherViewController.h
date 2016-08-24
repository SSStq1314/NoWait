//
//  OtherViewController.h
//  不等
//
//  Created by li on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *add1;
@property (weak, nonatomic) IBOutlet UIButton *add2;
@property (weak, nonatomic) IBOutlet UIButton *add3;
@property (weak, nonatomic) IBOutlet UIButton *add4;

@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UIImageView *ima1;
@property (weak, nonatomic) IBOutlet UIImageView *ima2;
@property (weak, nonatomic) IBOutlet UIImageView *ima3;
@property (weak, nonatomic) IBOutlet UIImageView *ima4;

- (IBAction)click:(UIButton *)sender;

@end
