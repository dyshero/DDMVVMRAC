//
//  DDBaseViewModel.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseViewModel.h"

@implementation DDBaseViewModel
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

- (instancetype)initWithViewModel:(DDBaseViewModel *)viewModel {
    if (self = [super init]) {
        
    }
    return self;
}
@end
