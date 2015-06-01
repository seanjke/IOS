//
//  ViewController.m
//  IOSTanks
//
//  Created by Иван Бердюгин on 19.05.15.
//  Copyright (c) 2015 Иван Бердюгин. All rights reserved.
//

#import "MyViewController.h"
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@interface MyViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation MyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    [self addConstreints];
}

-(void) setUp {
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button addTarget:self action:@selector(myByttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"TestButton" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0]];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.button];
}

-(UIButton*) myByttonAction:(id)sender {
    [self moveButton:sender];
    return sender;
}

-(void)moveButton:(id)button {
    CGRect frameMainView = [self.view frame];
    CGRect frameButton   = [button frame];
    int maxHeight = frameMainView.size.height - (frameButton.size.height / 2);
    int maxWidth  = frameMainView.size.width - (frameButton.size.width / 2);
    NSInteger Height = RAND_FROM_TO(frameButton.size.height / 2, maxHeight);
    NSInteger Width = RAND_FROM_TO(frameButton.size.width / 2, maxWidth);
    [button setCenter:CGPointMake(Width, Height)];
}

- (void) addConstreints
{
    
    NSDictionary *viewsDictionary = @{@"button":self.button};
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(50)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    [self.button addConstraints:constraint_H];
    [self.button addConstraints:constraint_V];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.button
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:0.4
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.button
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterY
                              multiplier:0.3
                              constant:0.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
