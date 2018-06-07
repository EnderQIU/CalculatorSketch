//
//  ExpressionEvaluator.m
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ExpressionEvaluator.h"

@implementation ExpressionEvaluator

+ (NSNumber*)evalExpressionWithString:(NSString *)numericExpression{
    NSExpression * expression = [NSExpression expressionWithFormat:numericExpression];
    NSNumber * result = [expression expressionValueWithObject:nil context:nil];
    return result;
}

+ (NSNumber*)evalExpressionWithString:(NSString *)numericExpression andXValue:(float) xValue{
    NSString * stringFloat = [NSString stringWithFormat:@"%f",xValue];
    NSString * bracketedXValue = [NSString stringWithFormat:@"(%@)", stringFloat];
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"x" withString:bracketedXValue];
    return [ExpressionEvaluator evalExpressionWithString:numericExpression];
}
@end
