//
//  MyTableViewCell.h
//  不等
//
//  Created by ssstq1314 on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "First.h"

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UIView *color;
@property (nonatomic,strong)First * first;
@property (weak, nonatomic) IBOutlet UILabel *weather;

@end
