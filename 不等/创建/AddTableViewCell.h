//
//  AddTableViewCell.h
//  不等
//
//  Created by li on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cutInterfaceDelegate <NSObject>

-(void)cutInterface:(UIButton*)but;

@end
@interface AddTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *spot;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *VV;
@property (nonatomic,weak)id<cutInterfaceDelegate>dele;
- (IBAction)click:(UIButton *)sender;

@end
