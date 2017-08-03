//
//  DDMineViewModel.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDMineViewModel.h"

@implementation DDMineViewModel
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithTitle:title]) {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel {
    self.headClickSubject = [RACSubject subject];
    [self.headClickSubject subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}
@end
