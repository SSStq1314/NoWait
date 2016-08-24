//
//  Scrawl.m
//  不等
//
//  Created by li on 16/5/25.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "Scrawl.h"

@implementation Scrawl


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    for (int i=0; i<_array.count; i++) {
        NSMutableArray* arr=_array[i];
        for (int j=0; j<arr.count; j++) {
            CGPoint cg=[arr[j] CGPointValue];
            if (j==0) {
                CGContextMoveToPoint(ctx, cg.x, cg.y);
            }else{
                CGContextAddLineToPoint(ctx, cg.x, cg.y);
            }
        }
    }
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextStrokePath(ctx);
}
-(NSMutableArray *)array{
    if (_array==nil) {
        _array=[[NSMutableArray alloc]init];
    }
    return _array;
}
-(void)revoke{
    [_array removeLastObject];
    [self setNeedsDisplay];
}
-(void)dele{
    [_array removeAllObjects];
    [self setNeedsDisplay];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSMutableArray* arr=[[NSMutableArray alloc]init];
    UITouch* tou=[touches anyObject];
    CGPoint p=[tou locationInView:tou.view];
    [arr addObject:[NSValue valueWithCGPoint:p]];
    [self.array addObject:arr];
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSMutableArray* arr=[_array lastObject];
    UITouch* tou=[touches anyObject];
    CGPoint p=[tou locationInView:tou.view];
    [arr addObject:[NSValue valueWithCGPoint:p]];
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSMutableArray* arr=[_array lastObject];
    UITouch* tou=[touches anyObject];
    CGPoint p=[tou locationInView:tou.view];
    [arr addObject:[NSValue valueWithCGPoint:p]];
    [self setNeedsDisplay];
}
@end
