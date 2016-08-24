//
//  Content.h
//  不等
//
//  Created by li on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Content : UIView
@property (nonatomic,copy)NSString* word;
@property (nonatomic,copy)NSString* date;
@property (nonatomic,retain)NSNumber* textFont;
@property (nonatomic,copy)NSString* backGround;
@property (nonatomic,copy)NSString* label;
@property (nonatomic,retain)NSArray* imaArr;
@property (nonatomic,copy)NSString* weather;
-(id)initWithWord:(NSString*)word Date:(NSString*)date TextFont:(NSNumber*)textFont BackGround:(NSString*)backGround Label:(NSString*)label ImaArr:(NSArray*)imaArr Weather:(NSString*)weather;
@end
