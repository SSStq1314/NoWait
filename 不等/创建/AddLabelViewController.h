//
//  AddLabelViewController.h
//  不等
//
//  Created by li on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLabelViewController : UIViewController
- (IBAction)click:(UIButton *)sender;
- (IBAction)add:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *text;

@end
