//
//  UIImage+MJ.m
//  tuya
//
//  Created by li on 16/5/13.
//  Copyright © 2016年 中软国际013. All rights reserved.
//

#import "UIImage+MJ.h"

@implementation UIImage (MJ)
+(id)captureWithView:(UIView*)view{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0);//开启上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];//将控制器的view的layer渲染到上下文
    UIImage* iview=UIGraphicsGetImageFromCurrentImageContext();//取出图片
    UIGraphicsEndImageContext();//结束上下文
    return iview;
}
@end
