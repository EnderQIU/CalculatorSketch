//
//  ExpressionEvaluator.h
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpressionEvaluator : NSObject

+ (NSNumber*)evalExpressionWithString:(NSString*) numericExpression;

+ (NSNumber*)evalExpressionWithString:(NSString *)numericExpression andXValue:(float) xValue;
@end
