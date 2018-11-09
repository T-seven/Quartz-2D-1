//
//  TMYShapeView.m
//  TMYView
//
//  Created by TMY on 2018/11/5.
//  Copyright © 2018 tmy. All rights reserved.
//

#import "TMYShapeView.h"

@implementation TMYShapeView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
   
    drawText();
}

void drawText()
{
    CGRect startRect = CGRectMake(100, 100, 100, 100);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, startRect);
    [[UIColor redColor] set];
    CGContextStrokePath(ctx);

    
    NSString *str = @"测试文字";
    NSMutableDictionary *attDicts = [NSMutableDictionary dictionary];
    attDicts[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [str drawInRect:startRect withAttributes:attDicts];
}

//画四边形
void draw4Rect()
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));
    CGContextSetLineWidth(ctx, 10);
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
    CGContextStrokePath(ctx);//实心
}

//画三角形
void drawTriangle()
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextStrokePath(ctx);//实心

    CGContextMoveToPoint(ctx, 100, 100);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextAddLineToPoint(ctx, 150, 80);
    CGContextClosePath(ctx);
    
    CGContextStrokePath(ctx);//空心
    
}


@end
