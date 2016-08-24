//
//  AddOper.h
//  不等
//
//  Created by li on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "Label.h"
#import "Content.h"
@interface AddOper : UIView
@property (nonatomic,retain)FMDatabase* aa;
-(NSMutableArray*)labelAll;
-(void)dele:(NSString*)labelName;
-(void)inse:(Label*)la;
-(void)update:(Label*)la;
-(BOOL)inseContent:(Content*)con;
@end
