//
//  AddTableViewCell.m
//  不等
//
//  Created by li on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "AddTableViewCell.h"
#import "Dl.h"
@implementation AddTableViewCell

- (void)awakeFromNib {
    _spot.layer.cornerRadius=9;
    _VV.layer.cornerRadius=13;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)click:(UIButton *)sender {
    [self.dele cutInterface:sender];
}
@end
