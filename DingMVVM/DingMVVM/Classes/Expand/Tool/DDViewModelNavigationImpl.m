//
//  DDViewModelNavigationImpl.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDViewModelNavigationImpl.h"
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
@end
