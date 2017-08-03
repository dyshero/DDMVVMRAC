//
//  DDViewModelNavigationImpl.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDViewModelServices.h"

@interface DDViewModelNavigationImpl : NSObject<DDViewModelServices>
@property(nonatomic,copy)NSString *className;
- (instancetype)initWithNavigationController:(UINavigationController *)navi;
@end
