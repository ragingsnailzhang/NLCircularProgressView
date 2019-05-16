//
//  NLCycleView.m
//  NLCircularProgressViewDemo
//
//  Created by yj_zhang on 2018/3/22.
//  Copyright © 2018年 yj_zhang. All rights reserved.
//

#import "NLCycleView.h"

#define ViewWidth self.frame.size.width   //环形进度条的视图宽度

@interface NLCycleView(){
    CAShapeLayer *arcLayer;
}
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,assign)CGFloat radius;//环形进度条的半径

@end

@implementation NLCycleView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    if (self.progress > 1) {
        self.progress = 1;
    }else if (self.progress < 0){
        self.progress = 0;
    }
    
    if (!self.progressWidth) {
        self.progressWidth = 1.f;
    }
    self.radius = ViewWidth/2-self.progressWidth;
    
    CGContextRef progressContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(progressContext, self.progressWidth);
    CGContextSetRGBStrokeColor(progressContext, 209.0/255.0, 209.0/255.0, 209.0/255.0, 1);
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    //绘制环形进度条底框
    CGContextAddArc(progressContext, xCenter, yCenter, self.radius, 0, 2*M_PI, 0);
    CGContextDrawPath(progressContext, kCGPathStroke);
    
    //    //绘制环形进度环
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI *2; // - M_PI * 0.5为改变初始位置
    
    // 进度数字字号,可自己根据自己需要，从视图大小去适配字体字号
    int fontNum = ViewWidth/6;;
    if (self.fontSize) {
        fontNum = self.fontSize;
    }
    int weight = ViewWidth - self.progressWidth*2;
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, weight, fontNum)];
    }
    _label.center = CGPointMake(xCenter, yCenter);
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont boldSystemFontOfSize:fontNum];
    _label.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
    
    if (self.fontColor) {
        _label.textColor = self.fontColor;
    }
    _label.text = [NSString stringWithFormat:@"%.f%%",self.progress*100.0];
    if (self.fontHidden) {
        _label.hidden = self.fontHidden;
    }
    
    [self addSubview:_label];
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(xCenter,yCenter) radius:self.radius startAngle:- M_PI * 0.5 endAngle:to clockwise:YES];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor = [UIColor clearColor].CGColor;
    arcLayer.strokeColor=[UIColor colorWithRed:227.0/255.0 green:91.0/255.0 blue:90.0/255.0 alpha:1].CGColor;
    if (self.strokeColor) {
        arcLayer.strokeColor=self.strokeColor.CGColor;
    }
    arcLayer.lineWidth=self.progressWidth;
    arcLayer.lineCap = @"round";
    arcLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:arcLayer];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self drawLineAnimation:arcLayer];
    });
    
}

//定义动画过程
-(void)drawLineAnimation:(CALayer*)layer
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=0.01f;//动画时间
    //    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
    
}
-(void)setProgress:(CGFloat)progress{
    [arcLayer removeFromSuperlayer];
    _progress = progress;
    [self setNeedsDisplay];
}

@end
