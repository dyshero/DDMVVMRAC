//
//  DDBaseViewController.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDBaseViewModel;

@interface DDBaseViewController : UIViewController<UIGestureRecognizerDelegate>
@property(nonatomic,strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

- (instancetype)initWithViewModel:(DDBaseViewModel *)viewModel;

@end
