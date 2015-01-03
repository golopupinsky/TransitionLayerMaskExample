//
//  ViewController.m
//  TransitionLayerMaskExample
//
//  Created by Sergey Yuzepovich on 29.12.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

-(IBAction)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
