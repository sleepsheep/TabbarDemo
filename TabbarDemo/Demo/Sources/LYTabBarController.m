//
//  LYTabBarController.m
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYImageBar.h"
#import "LYBarItem.h"
#import "SystemConst.h"

@interface LYTabBarModel : NSObject

@property (nonatomic, strong) NSString *normalImage;
@property (nonatomic, strong) NSString *selectedImage;
@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation LYTabBarModel

@end


@interface LYTabBarController ()
@property (nonatomic, strong) NSMutableArray *muArrModel;
@property (nonatomic, strong) LYImageBar *imagBar;
@property (nonatomic, strong) LYBarItem *curBarItem;
@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _muArrModel = [NSMutableArray array];
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)setViewControllers:(NSArray *)arr {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        NSString *viewController = dic[kViewController];
        NSString *normalImg = dic[kNormalImage];
        NSString *selectedImg = dic[kSelectedImage];
        
        Class vc =  NSClassFromString(viewController);
        UIViewController *viewC  = [vc new];

        LYTabBarModel *tabP = [LYTabBarModel new];
        tabP.viewController = viewC;
        tabP.normalImage = normalImg;
        tabP.selectedImage = selectedImg;
        [_muArrModel addObject:tabP];//自己管理自己的数据
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewC];
        [tempArr addObject:nav];
    }
    
    [super setViewControllers:tempArr];
    
    [self creatTabBar];
}

//创建tabbar
#define BARHEIGHT 49
- (void)creatTabBar {
    self.tabBar.backgroundColor = [UIColor orangeColor];
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    //添加自定义的tabbar
    _imagBar = [[LYImageBar alloc] initWithFrame:CGRectMake(0, height - BARHEIGHT, width, BARHEIGHT)];
    [_imagBar setBackgroundColor:[UIColor whiteColor]];
//    _imagBar.image = [UIImage imageNamed:@"tabbar_bg"];
    
    [self.view addSubview:_imagBar];
    
    [self addBarItems];
}

//添加自定义Bar按钮
- (void)addBarItems {
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    CGFloat itemWidth = width/_muArrModel.count;
    
    for (int i =  0; i < _muArrModel.count; i++) {
        //先获取每个item的信息
        LYTabBarModel *tabBar = _muArrModel[i];
        NSString *normalImg = tabBar.normalImage;
        NSString *selectedImg = tabBar.selectedImage;
        
        //布局每个按钮
        LYBarItem *barItem = [[LYBarItem alloc] init];
    
        [barItem setNormalImage:[UIImage imageNamed:normalImg]];
        [barItem setHeightedImage:[UIImage imageNamed:selectedImg]];
        [barItem addTarget:self action:@selector(item_Clicked:) forControlEvents:UIControlEventTouchUpInside];//设置按钮按下的事件
        
        barItem.tag = i + 100;
        barItem.frame = CGRectMake(i * itemWidth, height - BARHEIGHT, itemWidth, BARHEIGHT);
        if (i == 0) {
            [self item_Clicked:barItem];
        }
        
        [self.view addSubview:barItem];
    }
}

- (void)item_Clicked:(LYBarItem *)barItem {
    NSInteger index = barItem.tag - 100;
    barItem.selected = YES;
    [barItem showHeighted:YES];
    self.selectedIndex = index;

    if (barItem != _curBarItem) {
        _curBarItem.selected = NO;
        [_curBarItem showHeighted:NO];
    }
    _curBarItem = barItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
