//
//  DDHomeController.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDHomeController.h"
#import "DDHomeCollectionView.h"
#import "DDHomeViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface DDHomeController ()
@property(nonatomic,strong)DDHomeViewModel *viewModel;
@property (nonatomic,strong) DDHomeCollectionView *collectionView;
@end

@implementation DDHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    [self bindViewModel];
}

- (void)bindViewModel {
    RAC(self.collectionView,dataArray) = RACObserve(self.viewModel,dataArray);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.viewModel.refreshCommand execute:self.collectionView];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)configView {
    [self.view addSubview:self.collectionView];
}

#pragma mark 懒加载
- (DDHomeCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
        _collectionView = [[DDHomeCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 49 - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor yellowColor];
    }
    return _collectionView;
}
@end
