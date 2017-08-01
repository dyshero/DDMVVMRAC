//
//  DDBaseTabbarController.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseTabbarController.h"
#import "DDBaseNavController.h"
#import "DDHomeController.h"
#import "DDClassifyController.h"
#import "DDShopCartController.h"
#import "DDMineController.h"

@interface DDBaseTabbarController ()

@end

@implementation DDBaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChileVC];
}

- (void)addChileVC
{
    DDHomeController *homeVC = [[DDHomeController alloc] initWithViewModel:[[DDHomeViewModel alloc] initWithTitle:@"首页"]];
    DDBaseNavController *nav1 = [self setChildVC:homeVC title:@"首页" imageName:@"homeNormal" withSelectedName:@"homeHight"];

    DDClassifyController *cateVC = [[DDClassifyController alloc] initWithViewModel:[[DDClassifyViewModel alloc] initWithTitle:@"分类"]];
    DDBaseNavController *nav2 =  [self setChildVC:cateVC title:@"分类" imageName:@"categoryNormal" withSelectedName:@"categoryHight"];

    DDShopCartController *shopVC = [[DDShopCartController alloc] initWithViewModel:[[DDShopCartViewModel alloc] initWithTitle:@"分类"]];
    DDBaseNavController *nav3 =  [self setChildVC:shopVC title:@"购物车" imageName:@"carNormal" withSelectedName:@"carHight"];

    DDMineController *meVC = [[DDMineController alloc] initWithViewModel:[[DDMineViewModel alloc] initWithTitle:@"分类"]];
    DDBaseNavController *nav4 =  [self setChildVC:meVC title:@"我的" imageName:@"meNoraml" withSelectedName:@"meHight"];

    self.viewControllers = @[nav1,nav2,nav3,nav4];
}


- (DDBaseNavController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName
{
    vc.title                = title;
    vc.tabBarItem.image     = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];

    vc.tabBarController.tabBar.tintColor   = THEME_COLOR;

    NSDictionary *dic       = @{NSForegroundColorAttributeName:BLACK_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];

    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];

    DDBaseNavController *nav = [[DDBaseNavController alloc]initWithRootViewController:vc];

    return nav;
}

@end
