//
//  MyTableViewCell.m
//  不等
//
//  Created by ssstq1314 on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    
    _text.numberOfLines = 0;
    _color.layer.cornerRadius = 5;
    _color.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
