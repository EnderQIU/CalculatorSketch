//
//  CalculatorViewController.m
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize expression = _expression;
@synthesize result = _result;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonPressed:(id)sender {
    _result.text = @"";
    NSString * character = [sender currentTitle];
    _expression.text = [_expression.text stringByAppendingString:character];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_expression.text forKey:@"expression"];
}

- (IBAction)backspaceButtonPressed:(id)sender {
    _result.text = @"";
    NSString * origin = _expression.text;
    NSString * cut;
    if ([origin length] > 0) cut = [origin substringToIndex:[origin length] - 1];
    else cut = origin;
    _expression.text = cut;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_expression.text forKey:@"expression"];
}

- (IBAction)enterButtonPressed:(id)sender {
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.usesSignificantDigits = YES;
    _result.text = [numberFormatter stringFromNumber:[ExpressionEvaluator evalExpressionWithString:_expression.text]];
}
@end
