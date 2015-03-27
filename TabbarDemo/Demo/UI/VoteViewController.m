//
//  VoteViewController.m
//  sina
//
//  Created by student on 15-1-23.
//  Copyright (c) 2015年 刘洋. All rights reserved.
//

#import "VoteViewController.h"

@implementation VoteViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Custom initialization
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Vote";
        self.view.backgroundColor = [UIColor colorWithRed:0.209 green:1.000 blue:0.258 alpha:1.000];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
