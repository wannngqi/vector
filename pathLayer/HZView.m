//
//  HZView.m
//  pathLayer
//
//  Created by wangqi on 2020/3/12.
//  Copyright © 2020 王琪. All rights reserved.
//

#import "HZView.h"
#import <Accelerate/Accelerate.h>

CGPoint o = {0,0};

@implementation HZView
{
    CGPoint mp;
    
    CGPoint dp;
    
    CGPoint dp2;
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    self.backgroundColor = [UIColor blueColor];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(o.x, o.y)];
    [path addLineToPoint:CGPointMake(mp.x, mp.y)];
    path.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [path stroke];
    
    
    UIBezierPath *dot = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(dp.x-5, dp.y-5, 10, 10) cornerRadius:5];
    
    dot.lineWidth = 10;
    
    [[UIColor yellowColor] setStroke];
    
    [dot stroke];
    
    
    UIBezierPath *dot2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200-5, 200-5, 10, 10) cornerRadius:5];
    
    dot2.lineWidth = 10;
    
    [[UIColor greenColor] setStroke];
    
    [dot2 stroke];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.allObjects[0];
    
    CGPoint p = [t locationInView:self];
    
    
    mp = p;
    
    
    double u[2] = {200, 200};
    
    double v[2] = {mp.x - o.x,mp.y - o.y};
    
    double uv = 0;
    
    vDSP_dotprD(u, 1, v, 1, &uv, 2);
    
//    uv = sqrt(uv);
    
    double v2 = pow(v[0], 2) + pow(v[1], 2);
    
    dp.x = uv/v2 * v[0];
    dp.y = uv/v2 * v[1];
    
    
    
    
    
   
    
    
    
    
    
    
    
//
//    double u2[2] = {100,50};
//
//    double uv2 = 0;
//
//    vDSP_dotprD(u2, 1, v, 1, &uv2, 2);
//
//    double v22 = pow(v[0], 2) + pow(v[1], 2);
//
//    dp2.x = uv2/v22 * v[0];
//    dp2.y = uv2/v22 * v[1];
    
    
    
    
    NSLog(@"==x[%f]=", v[0] * dp.x + v[1] * dp.y);
    
    
    [self setNeedsDisplay];
    
}

@end
