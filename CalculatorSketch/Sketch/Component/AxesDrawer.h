//
//  AxesDrawer.h
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxesDrawer : NSObject

+ (void)drawAxesInRect:(CGRect)bounds originAtPoint:(CGPoint)axisOrigin scale:(CGFloat)pointsPerUnit;

@end
