//
//  Oper.h
//  不等
//
//  Created by li on 16/5/27.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface Oper : UIViewController
@property (nonatomic,retain)FMDatabase* aa;
-(void)updatePic:(NSString*)str;
-(NSString*)selePic;
@end
