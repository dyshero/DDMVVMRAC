//
//  DDViewModelNavigationImpl.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDViewModelNavigationImpl.h"
#import "DDBaseViewController.h"

@interface DDViewModelNavigationImpl ()
@property(nonatomic,weak) UINavigationController *navigationController;
@end

@implementation DDViewModelNavigationImpl
- (instancetype)initWithNavigationController:(UINavigationController *)navi
{
    self = [super init];
    if (self)
    {
        _navigationController = navi;
    }
    return self;
}

- (void)pushViewModel:(DDBaseViewModel *)viewModel animated:(BOOL)animated {
    if (!_navigationController)
    {
        NSLog(@"没有导航");
        return;
    }
    if (_className.length <= 0)
    {
        [SVProgressHUD showWithStatus:@"错误,未指定viewController"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    DDBaseViewController *vc = [[NSClassFromString(_className) alloc] initWithViewModel:viewModel];
    if (!vc)
    {
        NSLog(@"VC名字错误");
        return;
    }
    [_navigationController pushViewController:vc animated:animated];
}

- (void)popViewControllerWithAnimation:(BOOL)animated {

}

- (void)popToRootViewModelWithAnimation:(BOOL)animated {

}

- (void)presentViewModel:(DDBaseViewModel *)viewModel animated:(BOOL)animated complete:(void (^)())complete {
    
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void (^)())complete {
    
}
@end
