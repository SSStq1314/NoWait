//
//  Money.h
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

@property (nonatomic,retain)NSNumber *money;
@property (nonatomic,copy)NSString *mark;
@property (nonatomic,copy)NSString *date;
@property (nonatomic,copy)NSString *type;

- (id)initWithMoney:(NSNumber *)money mark:(NSString *)mark date:(NSString *)date type:(NSString *)type;
@end
