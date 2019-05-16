//
//  NLCycleView.h
//  NLCircularProgressViewDemo
//
//  Created by yj_zhang on 2018/3/22.
//  Copyright © 2018年 yj_zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCycleView : UIView

@property(nonatomic,assign)CGFloat progress;//进度

@property(nonatomic,assign)CGFloat fontSize; //字体大小

@property(nonatomic,strong)UIColor *fontColor; //字体颜色

@property(nonatomic,assign)BOOL fontHidden; //字体隐藏

@property(nonatomic,strong)UIColor *strokeColor; //圆环颜色

@property(nonatomic,assign)CGFloat progressWidth;//环形进度条的圆环宽度

@end
