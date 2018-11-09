//
//  TMYYellowMan.m
//  TMYView
//
//  Created by TMY on 2018/11/6.
//  Copyright © 2018 tmy. All rights reserved.
//

#import "TMYYellowMan.h"

#define kRadius 70
#define kOriginY 200
#define kColor(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255 alpha:1]
#define kMedH 100

@interface TMYYellowMan()


@end


@implementation TMYYellowMan


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    drawBody(ctx, rect);
    drawMouse(ctx, rect);
    drawEyes(ctx, rect);
    drawHairs(ctx, rect);
    drawPants(ctx, rect);
}

void drawBody(CGContextRef ctx, CGRect rect) {
    //上半圆
    CGFloat topX = rect.size.width * 0.5;
    CGFloat topY = kOriginY;
    CGFloat topRadius = kRadius;
    CGContextAddArc(ctx, topX, topY, topRadius, 0, M_PI, 1);
    
    //中间线
    CGFloat medH = kMedH;
    CGFloat medX = topX - topRadius;
    CGFloat medY = topY + medH;
    CGContextAddLineToPoint(ctx, medX, medY);
    
    //下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = medY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    
    CGContextClosePath(ctx);
    
    [kColor(255, 217, 11) set];

    CGContextFillPath(ctx);
}

void drawEyes(CGContextRef ctx, CGRect rect) {
    //1， 黑色绑带
    CGFloat eyesX = rect.size.width * 0.5 - kRadius;
    CGFloat eyesY = kOriginY;
    CGFloat eyesLineWidth = 10;
    CGFloat eyesEndX = eyesX + 2*kRadius;
    CGFloat eyesEndY = eyesY;
    CGContextMoveToPoint(ctx, eyesX, eyesY);

    CGContextAddLineToPoint(ctx, eyesEndX, eyesEndY);
    
    CGContextSetLineWidth(ctx, eyesLineWidth);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);

    //2, 圆眼睛
    CGFloat circelRadius = kRadius * 0.4;
    CGFloat circelX = rect.size.width * 0.5 - circelRadius;
    CGFloat circelY = eyesY;
    CGContextAddArc(ctx, circelX, circelY, circelRadius, 0, 2*M_PI, 0);

    CGFloat circelRightX = rect.size.width * 0.5 + circelRadius;
    CGFloat circelRightY = eyesY;
    CGContextAddArc(ctx, circelRightX, circelRightY, circelRadius, 0, 2*M_PI, 0);
    [kColor(66, 60, 67) set];
    CGContextFillPath(ctx);
    
    //白色部分
    CGFloat medRadius = kRadius * 0.3;
    CGFloat medX = circelX;
    CGFloat medY = eyesY;
    CGContextAddArc(ctx, medX, medY, medRadius, 0, 2*M_PI, 0);
    
    CGFloat medRightX = circelRightX;
    CGFloat medRightY = circelRightY;
    CGContextAddArc(ctx, medRightX, medRightY, medRadius, 0, 2*M_PI, 0);
    
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    //黑色部分
    CGFloat minRadius = kRadius * 0.13;
    CGFloat minX = rect.size.width * 0.5 - medRadius;
    CGFloat minY = eyesY;
    CGContextAddArc(ctx, minX, minY, minRadius, 0, 2*M_PI, 0);
    
    CGFloat minRightX = rect.size.width * 0.5 + medRadius;
    CGFloat minRightY = circelRightY;
    CGContextAddArc(ctx, minRightX, minRightY, minRadius, 0, 2*M_PI, 0);
    
    [kColor(78, 19, 10) set];
    CGContextFillPath(ctx);
    
    //最后的白色部分
    CGFloat minMargin = 2;
    CGFloat lastRadius = kRadius * 0.03;
    CGFloat lastX = rect.size.width * 0.5 - medRadius - minMargin;
    CGFloat lastY = eyesY - eyesLineWidth/2;
    CGContextAddArc(ctx, lastX, lastY, lastRadius, 0, 2*M_PI, 0);
    
    CGFloat lastRightX = rect.size.width * 0.5 + medRadius - minMargin;
    CGFloat lastRightY = lastY;
    CGContextAddArc(ctx, lastRightX, lastRightY, lastRadius, 0, 2*M_PI, 0);
    
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
}

void drawMouse(CGContextRef ctx, CGRect rect) {
    //用贝塞尔曲线，
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    //中间控制点
    CGFloat controlX = rect.size.width * 0.5;
    CGFloat controlY = kOriginY + rect.size.width * 0.15 + marginY;
    
    //当前点：
    CGFloat currentX = controlX - marginX ;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(ctx, currentX, currentY);

    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    //贝塞尔曲线
    CGContextAddQuadCurveToPoint(ctx, controlX, controlY, endX, endY);
    
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 1);
    CGContextStrokePath(ctx);
}

void drawHairs(CGContextRef ctx, CGRect rect) {
    CGFloat hairX = rect.size.width * 0.5;
    CGFloat hairH = 20;
    CGFloat hairStartY = kOriginY - hairH - kRadius;
    CGFloat hairMargin = 10;
    CGFloat hairHbottom = 5;
    CGFloat hairY = kOriginY - kRadius + hairHbottom;
    CGContextMoveToPoint(ctx, hairX, hairStartY);
    CGContextAddLineToPoint(ctx, hairX, hairY);
    CGContextMoveToPoint(ctx, hairX - hairMargin - hairHbottom, hairStartY);
    CGContextAddLineToPoint(ctx, hairX - hairMargin, hairY);
    CGContextMoveToPoint(ctx, hairX + hairMargin + hairHbottom, hairStartY);
    CGContextAddLineToPoint(ctx, hairX + hairMargin, hairY);
    CGContextMoveToPoint(ctx, hairX - 2*hairMargin - hairHbottom - 2, hairStartY);
    CGContextAddLineToPoint(ctx, hairX - 2*hairMargin, hairY);
    CGContextMoveToPoint(ctx, hairX + 2*hairMargin + hairHbottom + 2, hairStartY);
    CGContextAddLineToPoint(ctx, hairX + 2*hairMargin, hairY);
    
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 1);
    CGContextStrokePath(ctx);
}

void drawPants(CGContextRef ctx, CGRect rect) {
    CGFloat marginY = 30;
    CGFloat pantsH = 2*kRadius / 3;
    CGFloat pantsSlid = 20;
    CGFloat pantsX = rect.size.width * 0.5 - kRadius;
    CGFloat pantsY = kOriginY + rect.size.width * 0.15 + marginY;
    CGFloat medPantsX = pantsX + pantsH;
    CGFloat medPantsY = pantsY + pantsSlid;
    CGFloat endPantsX = rect.size.width * 0.5 + kRadius;
    CGContextMoveToPoint(ctx, pantsX, pantsY);
    CGContextAddLineToPoint(ctx, medPantsX, medPantsY);
    CGContextAddLineToPoint(ctx, medPantsX+pantsH, medPantsY);
    CGContextAddLineToPoint(ctx, endPantsX, pantsY);
    CGContextSetLineWidth(ctx, 10);
    [kColor(41, 70, 107) set];
    CGContextStrokePath(ctx);
    
    CGFloat fanshapedPointsX = rect.size.width * 0.5;
    CGFloat fanshapedPointsY = kOriginY + kMedH;
    CGContextMoveToPoint(ctx, medPantsX+pantsH, medPantsY);
    CGContextAddArc(ctx, fanshapedPointsX, fanshapedPointsY, kRadius, M_PI_4, 3*M_PI_4, 0);
    CGContextAddLineToPoint(ctx, medPantsX, medPantsY);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    //扣子
    CGFloat bX = medPantsX + pantsH/2;
    CGFloat bY = medPantsY + pantsSlid;
//    CGContextMoveToPoint(ctx, bX, bY);
    CGContextAddArc(ctx, bX, bY, 4, 0, 2*M_PI, 0);
    CGContextAddArc(ctx, bX, bY + 12, 4, 0, 2*M_PI, 0);

    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    NSString *str = @"萌萌哒";
    [str drawInRect:CGRectMake(medPantsX, fanshapedPointsY + kRadius + 50, pantsH, pantsSlid) withAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
    
    
}

@end
