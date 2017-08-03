//
//  DDViewModelServices.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DDBaseViewModel;

@protocol DDViewModelServices <NSObject>
- (void)pushViewModel:(DDBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewControllerWithAnimation:(BOOL)animated;

- (void)popToRootViewModelWithAnimation:(BOOL)animated;

- (void)presentViewModel:(DDBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)())complete;

///模态弹出vc，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)())complete;
@end
