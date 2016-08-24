//
//  ScrawlViewController.h
//  不等
//
//  Created by li on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scrawl.h"
@interface ScrawlViewController : UIViewController

@property (weak, nonatomic) IBOutlet Scrawl *scrawl;
- (IBAction)revoke:(UIButton *)sender;

- (IBAction)dele:(UIButton *)sender;

@end
