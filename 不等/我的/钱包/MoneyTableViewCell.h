//
//  MoneyTableViewCell.h
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoneyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *type;

@property (weak, nonatomic) IBOutlet UILabel *mark;
@property (weak, nonatomic) IBOutlet UILabel *money;

@property (weak, nonatomic) IBOutlet UILabel *date;

@end
