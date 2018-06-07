//
//  SketchView.h
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Component/AxesDrawer.h"
#import "../Utils/ExpressionEvaluator.h"

@interface SketchView : UIView

@property (nonatomic) CGFloat scale;
@property (nonatomic) CGPoint origin;

@property NSString * expression;

@end
