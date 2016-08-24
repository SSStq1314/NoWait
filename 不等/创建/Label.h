//
//  Label.h
//  不等
//
//  Created by li on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Label : UIView
@property (nonatomic,retain)NSNumber* spotColor;
@property (nonatomic,copy)NSString* labelName;
-(id)initWithSpotColor:(NSNumber*)spotColor LabelName:(NSString*)labelName;
@end
