//
//  ScreenView.m
//  Metro
//
//  Created by Ace on 14/12/11.
//  Copyright (c) 2014年 com.hujao. All rights reserved.
//

#import "ScreenView.h"
#define minGrid 15
#define midGrid 75
@implementation ScreenView

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor=UIColorFromRGB(0x0095d9);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    CGContextSetLineWidth(context,SCREEN_WIDTH);
    CGContextSetStrokeColorWithColor(context,UIColorFromRGB(0x0095d9).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, 0, SCREEN_WIDTH, self.bounds.size.height));
    UIGraphicsPopContext();


    for (int x=midGrid; x<SCREEN_WIDTH; x+=midGrid) {
        CGContextSetLineWidth(context, 0.6);
        CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);//线条颜色
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x,rect.size.height);
        CGContextStrokePath(context);
    }
    for (int x=minGrid; x<SCREEN_WIDTH; x+=minGrid) {
        CGContextSetLineWidth(context, 0.3);
        CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);//线条颜色
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x,rect.size.height);
        CGContextStrokePath(context);
    }

    for (int x=midGrid; x<rect.size.height; x+=midGrid) {
        CGContextSetLineWidth(context, 0.6);
        CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);//线条颜色
        CGContextMoveToPoint(context, 0,x);
        CGContextAddLineToPoint(context,SCREEN_WIDTH, x);
        CGContextStrokePath(context);
    }
    for (int x=minGrid; x<rect.size.height; x+=minGrid) {
        CGContextSetLineWidth(context, 0.3);
        CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);//线条颜色
        CGContextMoveToPoint(context, 0,x);
        CGContextAddLineToPoint(context,SCREEN_WIDTH, x);
        CGContextStrokePath(context);
    }

}
@end
