//
//  NavigationControllerDelegate.m
//  TransitionLayerMaskExample
//
//  Created by Sergey Yuzepovich on 29.12.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "CircleTransitionAnimator.h"

@implementation NavigationControllerDelegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [[CircleTransitionAnimator alloc]init];
}
@end
