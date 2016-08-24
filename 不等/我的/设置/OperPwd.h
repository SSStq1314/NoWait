//
//  OperPwd.h
//  不等
//
//  Created by sgsgsg on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Pwd.h"
@interface OperPwd : NSObject
@property FMDatabase *db;
- (void)inserPwd:(NSString *)p;
- (void)deletePwd;
- (NSString*)select;
@end
