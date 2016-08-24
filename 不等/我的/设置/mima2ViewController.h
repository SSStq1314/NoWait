//
//  mima2ViewController.h
//  SecretCode
//
//  Created by li on 16/5/26.
//  Copyright © 2016年 中软国际013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperPwd.h"
@interface mima2ViewController : UIViewController
- (IBAction)click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *la;
- (IBAction)dele:(UIButton *)sender;
@property (nonatomic,retain)OperPwd* op;
@end
