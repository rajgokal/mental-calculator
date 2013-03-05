//
//  CalcFirstViewController.m
//  Mental Calculator
//
//  Created by Raj on 3/4/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import "CalcFirstViewController.h"

@interface CalcFirstViewController ()

@end

@implementation CalcFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // creating custom button properties
    UIFont *buttonFont = [UIFont fontWithName:@"Gotham Medium" size:17.0];
    UIColor *buttonColorDefault = [UIColor blackColor];
    UIColor *buttonColorHighlight = [UIColor blackColor];
    UIImage *btn = [UIImage imageNamed:@"Button.png"];
    UIImage *btnh = [UIImage imageNamed:@"ButtonHighlighted.png"];
    
    // building the buttons
    UIButton *Button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button1 setTitle:@"1" forState:UIControlStateNormal];
    [Button1 setFrame:CGRectMake(20, 57, 280, 87)];
    [Button1 setBackgroundImage:btn forState:UIControlStateNormal];
    [Button1 setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [Button1.titleLabel setFont:buttonFont];
    [Button1 setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [Button1 setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [Button1 addTarget:self action:@selector(pushMetrics:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Button1];
    
    UIButton *Button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button2 setTitle:@"2" forState:UIControlStateNormal];
    [Button2 setFrame:CGRectMake(20, 157, 280, 87)];
    [Button2 setBackgroundImage:btn forState:UIControlStateNormal];
    [Button2 setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [Button2.titleLabel setFont:buttonFont];
    [Button2 setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [Button2 setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [Button2 addTarget:self action:@selector(pushMetrics:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Button2];
    
    UIButton *Button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button3 setTitle:@"3" forState:UIControlStateNormal];
    [Button3 setFrame:CGRectMake(20, 257, 280, 87)];
    [Button3 setBackgroundImage:btn forState:UIControlStateNormal];
    [Button3 setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [Button3.titleLabel setFont:buttonFont];
    [Button3 setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [Button3 setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [Button3 addTarget:self action:@selector(pushMetrics:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Button3];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
