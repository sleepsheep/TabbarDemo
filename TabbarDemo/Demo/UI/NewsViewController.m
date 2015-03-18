//
//  NewsViewController.m
//  sina
//
//  Created by student on 15-1-23.
//  Copyright (c) 2015年 刘洋. All rights reserved.
//

#import "NewsViewController.h"

//NewsViewController是新闻tabbar对应的页面
@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"news";
        self.view.backgroundColor = [UIColor colorWithRed:0.719 green:0.196 blue:0.673 alpha:1.000];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
