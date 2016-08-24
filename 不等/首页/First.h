//
//  First.h
//  不等
//
//  Created by 中软国际新014 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface First : NSObject
@property (nonatomic,copy)NSString * word;

@property (nonatomic,retain)NSNumber * picid;

@property (nonatomic,retain)NSNumber * textfont;

@property (nonatomic,copy)NSString * labelcolor;

@property (nonatomic,copy)NSString * data;

@property (nonatomic,copy)NSString * weather;

@property (nonatomic,assign)NSNumber * shoucang;
- (id)initWithWord:(NSString *)word picid:(NSNumber *)picid Labelcolor:(NSString *)labelcolorcolor data:(NSString *)data TextFont:(NSNumber *)textfont shoucang:(NSNumber *)shoucang Weather:(NSString*)weather;
@end
