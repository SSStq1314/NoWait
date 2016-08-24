//
//  WriteViewController.h
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *sc;

- (IBAction)sender:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextField *money;

@property (weak, nonatomic) IBOutlet UITextField *mark;

@end
