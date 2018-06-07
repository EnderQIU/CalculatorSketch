//
//  CalculatorViewController.h
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Utils/ExpressionEvaluator.h"

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel * expression;
@property (weak, nonatomic) IBOutlet UILabel * result;


- (IBAction)buttonPressed:(id)sender;
- (IBAction)backspaceButtonPressed:(id)sender;
- (IBAction)enterButtonPressed:(id)sender;

@end
