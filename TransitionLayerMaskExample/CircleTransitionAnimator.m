//
//  CircleTransitionAnimator.m
//  TransitionLayerMaskExample
//
//  Created by Sergey Yuzepovich on 29.12.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import "CircleTransitionAnimator.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CircleTransitionAnimator ()
@property(weak) id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation CircleTransitionAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    UIView *containerView = [transitionContext containerView];
    ViewController *fromVC = (ViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = (ViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIButton *button = fromVC.button;
    
    [containerView addSubview:toVC.view];

    CGPoint extremePoint = CGPointMake(CGRectGetMidX(button.frame),CGRectGetMidY(button.frame) - CGRectGetHeight(toVC.view.bounds));
    CGFloat radius = sqrtf(extremePoint.x*extremePoint.x + extremePoint.y*extremePoint.y);
    
    UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame,
                                                                                             CGRectGetWidth(button.frame)/2-1,
                                                                                             CGRectGetHeight(button.frame)/2-1)];
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = circleMaskPathFinal.CGPath;
    toVC.view.layer.mask = mask;

    CABasicAnimation *maskAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskAnimation.fromValue = (__bridge id) (circleMaskPathInitial.CGPath);
    maskAnimation.toValue =  (__bridge id) (circleMaskPathFinal.CGPath);
    maskAnimation.duration = [self transitionDuration:transitionContext];
    maskAnimation.delegate = self;
    [mask addAnimation:maskAnimation forKey:@"path"];
}

//- (void)animationEnded:(BOOL) transitionCompleted;
//{
//    [self.transitionContext completeTransition:YES];
//}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext completeTransition:YES];
}
@end
