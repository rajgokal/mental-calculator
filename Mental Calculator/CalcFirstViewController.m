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

@synthesize output;
@synthesize operatorMode;
@synthesize signMode;
@synthesize firstNumber;
@synthesize secondNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Calculator", @"Calculator");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // modes and defaults
    signMode = [NSString stringWithFormat:@"positive"];
    operatorMode = [NSString stringWithFormat:@"number"];
    UIFont *defaultFont = [UIFont fontWithName:@"Gotham Medium" size:17.0];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    // set button properties
    int height = 70;
    int width = 70;
    int xpad = 8;
    int ypad = 7;
    int rowLength = 4;
    int outputHeight = 100;
    
    // text field for results
    output = [[UILabel alloc] initWithFrame:(CGRectMake(xpad,ypad,(width+xpad)*rowLength-xpad,outputHeight-ypad))];
    output.backgroundColor = [UIColor lightGrayColor];
    output.font = defaultFont;
    output.text = @"";
    [self.view addSubview:output];
    
    // set button names
    NSMutableArray *buttonTitles = [NSMutableArray arrayWithObjects:
                                    @"c",@"+/-",@"÷",@"x",
                                    @"1",@"2",@"3",@"-",
                                    @"4",@"5",@"6",@"+",
                                    @"7",@"8",@"9",
                                    nil];
    
    // creating custom button properties
    UIColor *buttonColorDefault = [UIColor blackColor];
    UIColor *buttonColorHighlight = [UIColor blackColor];
    UIImage *btn = [UIImage imageNamed:@"Button.png"];
    UIImage *btnh = [UIImage imageNamed:@"ButtonHighlighted.png"];
    
    // loop to create # buttons
    for (int i=0; i<buttonTitles.count; i++){
        
        NSString *buttonName = [NSString stringWithFormat:@"%d", i+1];
        buttonName = buttonTitles[i];
        UIImage *buttonColor = [UIImage imageNamed:@"ButtonHighlighted.png"];
        
        if([buttonName isEqual:@"c"] || [buttonName isEqual:@"+/-"] || [buttonName isEqual:@"÷"] || [buttonName isEqual:@"x"] || [buttonName isEqual:@"-"] || [buttonName isEqual:@"+"]){
            buttonColor = [UIImage imageNamed:@"ButtonHighlighted.png"];
        }
        else{
            buttonColor = [UIImage imageNamed:@"Button.png"];
        }
        
        // building the buttons
        UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [Button setTitle:buttonName forState:UIControlStateNormal];
        [Button setFrame:CGRectMake(xpad+i%rowLength*(width+xpad),outputHeight+ypad+i/rowLength*(height+ypad),width,height)];
        [Button setBackgroundImage:buttonColor forState:UIControlStateNormal];
        [Button setBackgroundImage:btnh forState:UIControlStateHighlighted];
        
        [Button.titleLabel setFont:defaultFont];
        [Button setTitleColor:buttonColorDefault forState:UIControlStateNormal];
        [Button setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
        [Button addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.view addSubview:Button];
    }

    // 0 button
    UIButton *zeroButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [zeroButton setTitle:@"0" forState:UIControlStateNormal];
    [zeroButton setFrame:CGRectMake(xpad,ypad+outputHeight+(height+ypad)*4,width*2+xpad,height)];
    [zeroButton setBackgroundImage:btn forState:UIControlStateNormal];
    [zeroButton setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [zeroButton.titleLabel setFont:defaultFont];
    [zeroButton setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [zeroButton setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [zeroButton addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:zeroButton];

    // . button
    UIButton *dotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dotButton setTitle:@"." forState:UIControlStateNormal];
    [dotButton setFrame:CGRectMake(xpad+(xpad+width)*2,ypad+outputHeight+(height+ypad)*4,width,height)];
    [dotButton setBackgroundImage:btn forState:UIControlStateNormal];
    [dotButton setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [dotButton.titleLabel setFont:defaultFont];
    [dotButton setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [dotButton setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [dotButton addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:dotButton];
    
    // = button
    NSString *buttonName = @"=";
    
    UIButton *equalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [equalButton setTitle:buttonName forState:UIControlStateNormal];
    [equalButton setFrame:CGRectMake(xpad+(xpad+width)*3,ypad+outputHeight+(height+ypad)*3,width,height*2+ypad)];
    [equalButton setBackgroundImage:btnh forState:UIControlStateNormal];
    [equalButton setBackgroundImage:btnh forState:UIControlStateHighlighted];
    
    [equalButton.titleLabel setFont:defaultFont];
    [equalButton setTitleColor:buttonColorDefault forState:UIControlStateNormal];
    [equalButton setTitleColor:buttonColorHighlight forState:UIControlStateHighlighted];
    [equalButton addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:equalButton];
    
}

- (void)buttonClicked:(id)sender;
{
    UIButton *buttonClicked = (UIButton *)sender;
    if([buttonClicked.currentTitle isEqual:@"c"]){
        [self clear];
    }
    else if([buttonClicked.currentTitle isEqual:@"+/-"]){
        output.text = [NSString stringWithFormat:@"-%@",output.text];
    }
    else if([buttonClicked.currentTitle isEqual:@"÷"]){
        firstNumber = [output.text floatValue];
        [self clear];
        operatorMode = @"divide";
    }
    else if([buttonClicked.currentTitle isEqual:@"x"]){
        firstNumber = [output.text floatValue];
        [self clear];
        operatorMode = @"multiply";
    }
    else if([buttonClicked.currentTitle isEqual:@"-"]){
        firstNumber = [output.text floatValue];
        [self clear];
        operatorMode = @"subtract";
    }
    else if([buttonClicked.currentTitle isEqual:@"+"]){
        firstNumber = [output.text floatValue];
        [self clear];
        operatorMode = @"add";
    }
    else if([buttonClicked.currentTitle isEqual:@"="]){
        secondNumber = [output.text floatValue];
        if ([operatorMode isEqual: @"add"]){
            output.text = [self truncateResult:[NSString stringWithFormat:@"%f",firstNumber+secondNumber]];
        }
        else if ([operatorMode isEqual: @"multiply"]){
            output.text = [self truncateResult:[NSString stringWithFormat:@"%f",firstNumber*secondNumber]];
        }
        else if ([operatorMode isEqual: @"subtract"]){
            output.text = [self truncateResult:[NSString stringWithFormat:@"%f",firstNumber-secondNumber]];
        }
        else if ([operatorMode isEqual: @"divide"]){
            output.text = [self truncateResult:[NSString stringWithFormat:@"%f",firstNumber/secondNumber]];
        }
        else
        [self clear];
        operatorMode = @"result";
    }
    else{
        if([operatorMode isEqual:@"result"]){
            [self clear];
            operatorMode = @"number";
        }
    output.text = [NSString stringWithFormat:@"%@%@",output.text,buttonClicked.currentTitle];
    }
}

- (void)clear
{
    output.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)truncateResult:(NSString *)longNumber
{
    NSString *lastDigit = [longNumber substringFromIndex:[longNumber length]-1];
        if([lastDigit isEqual:@"0"]){
            NSString *shortNumber = [longNumber substringToIndex:[longNumber length]-1];
            [self truncateResult:shortNumber];
        }
        else
            return longNumber;
    return longNumber;
}

@end
