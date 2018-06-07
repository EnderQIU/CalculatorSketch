//
//  SketchView.m
//  CalculatorSketch
//
//  Created by enderqiu on 2018/6/7.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "SketchView.h"

@implementation SketchView

@synthesize scale = _scale;
@synthesize origin = _origin;
@synthesize expression = _expression;

#define DEFAULT_SCALE 10

- (CGFloat)scale
{
    if (!_scale) return DEFAULT_SCALE;
    else return _scale;
}

- (CGPoint)origin
{
    if (!(_origin.x && _origin.y)) return CGPointMake(self.bounds.origin.x + self.bounds.size.width/2, self.bounds.origin.y + self.bounds.size.height/2);
    else return _origin;
}

- (void)setScale:(CGFloat)scale
{
    if (scale != _scale) {
        _scale = scale;
        [self setNeedsDisplay]; // call whenever scale changes
    }
}

- (void)setOrigin:(CGPoint)origin
{
    if (origin.x != _origin.x && origin.y != _origin.y) {
        _origin = origin;
        [self setNeedsDisplay]; // call whenever origin changes
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // self.contentMode = UIViewContentModeRedraw has been set in Interface Builder for iPhone
    }
    return self;
}

- (void)drawGraph
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _expression = [defaults stringForKey:@"expression"];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    [[UIColor blueColor] setStroke];
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, -1, -1);
    
    float xValue, yValue;
    int yPixel;
    int pointSize = self.contentScaleFactor;
    for (int xPixel = self.bounds.origin.x-1; xPixel < self.bounds.size.width; xPixel+=pointSize) {
        xValue = - ((self.origin.x - xPixel) / self.scale);
        yValue = [[ExpressionEvaluator evalExpressionWithString:_expression andXValue:xValue] floatValue];
        yPixel = self.origin.y - (yValue * self.scale);
        CGContextAddLineToPoint(context, xPixel, yPixel);
    }
    CGContextStrokePath(context);
}


- (void)drawRect:(CGRect)rect
{
    [AxesDrawer drawAxesInRect:self.bounds originAtPoint:self.origin scale:self.scale];
    [self drawGraph];
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.scale *=gesture.scale;
        gesture.scale = 1; // reset so result is not cumulative
    }
}

- (IBAction)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self];
        self.origin = CGPointMake(self.origin.x+translation.x, self.origin.y+translation.y);
        [gesture setTranslation:CGPointZero inView:self]; // reset so result is not cumulative
    }
}

- (IBAction)tap:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        self.origin = [gesture locationInView:self];
    }
}

@end
