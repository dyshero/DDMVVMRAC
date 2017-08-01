//
//  DDBaseViewController.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseViewController.h"
#import "DDBaseViewModel.h"

@interface DDBaseViewController ()
@property(nonatomic,strong,readwrite)DDBaseViewModel *viewModel;
@end

@implementation DDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithViewModel:(DDBaseViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}
@end
