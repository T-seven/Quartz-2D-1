//
//  TMYView.m
//  TMYView
//
//  Created by TMY on 2018/11/5.
//  Copyright © 2018 tmy. All rights reserved.
//

#import "TMYView.h"

@implementation TMYView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1. 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2， 拼接图形（路径）
    //设置一个起点
    CGContextMoveToPoint(ctx, 100, 100);
    //添加一条线段到（100， 100）
    CGContextAddLineToPoint(ctx, 200, 200);
    //设置线宽
    CGContextSetLineWidth(ctx, 10);
    // 渲染显示到view上
    CGContextStrokePath(ctx);
    
    //clockwise: 1逆时针 0 顺时针
    CGContextAddArc(ctx, rect.size.width * 0.5, rect.size.height * 0.5, 100, 0, M_PI, 1);
    //设置颜色
    [[UIColor redColor] set];
    // 渲染填充显示到view上
    CGContextFillPath(ctx);
}


@end
