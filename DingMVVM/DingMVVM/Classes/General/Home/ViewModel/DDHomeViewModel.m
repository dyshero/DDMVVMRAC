//
//  DDHomeViewModel.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDHomeViewModel.h"
#import "DDGoodsModel.h"

@implementation DDHomeViewModel
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithTitle:title]) {
        [self initViewModel];
    }
    return self;
}


- (void)initViewModel {
    self.refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal1 = [DDRequestManager getWithURL:@"http://www.jiuyunda.net:90/api/v1/product/slideshow" withParamater:@{@"id":@"56c45924c2fb4e2050000022"}];

        RACSignal *signal2 = [DDRequestManager postArrayDataWithURL:@"HomeData" withpramater:nil];
        
        RACSignal *signal3 = [self rac_liftSelector:@selector(updateData:dataArray:) withSignalsFromArray:@[signal1,signal2]];
        [signal3 subscribeNext:^(id x) {
            UICollectionView *collectionView = input;
            if ([collectionView.mj_header isRefreshing]) {
                [collectionView reloadData];
                [collectionView.mj_header endRefreshing];
            }
        }];
        return signal3;
    }];
}


- (void)updateData:(NSDictionary *)headDict dataArray:(NSArray *)dataArray
{
    if ([headDict[@"code"] integerValue] == 100)
    {
        self.headData = headDict[@"data"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in dataArray)
        {
            DDGoodsModel *good = [DDGoodsModel objectWithDict:dic];
            [array addObject:good];
        }
        self.dataArray = [NSArray arrayWithArray:array];
    } else
    {
        self.headData = [NSArray array];
        self.dataArray = [NSArray array];
    }
    
}
@end
