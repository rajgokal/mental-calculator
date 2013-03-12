//
//  CalcFirstViewController.h
//  Mental Calculator
//
//  Created by Raj on 3/4/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcFirstViewController : UIViewController

@property (nonatomic, retain) UILabel *output;
@property (nonatomic, retain) NSString *operatorMode;
@property (nonatomic, retain) NSString *signMode;
@property float firstNumber;
@property float secondNumber;

@end
