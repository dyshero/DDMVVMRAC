//
//  DDClassifyViewModel.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyViewModel.h"
#import "DDGoodsDetailViewModel.h"
#import "DDGoodsModel.h"

@interface DDClassifyViewModel ()
@end

@implementation DDClassifyViewModel
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithTitle:title]) {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel {
    self.refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        UITableView *leftTableView = input[0];
        UITableView *rightTableView = input[1];
        RACSignal *signal = [DDRequestManager postArrayDataWithURL:@"CategoryAllGoods" withpramater:nil];
        [signal subscribeNext:^(id x) {
            NSArray *array = x;
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![self.dataDic valueForKey:obj[@"category_name"]])
                {
                    NSMutableArray *mArray = [NSMutableArray array];
                    DDGoodsModel *good = [DDGoodsModel objectWithDict:obj];
                    [mArray addObject:good];
                    self.dataDic[obj[@"category_name"]] = mArray;
                }else
                {
                    NSMutableArray *mArray = self.dataDic[obj[@"category_name"]];
                    DDGoodsModel *good = [DDGoodsModel objectWithDict:obj];
                    [mArray addObject:good];
                }
            }];
             self.leftArray = [self.dataDic allKeys];
            [leftTableView reloadData];
            [rightTableView reloadData];
        }];
        return signal;
    }];
    
    self.leftClickCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        UITableView *tableView = input[0];
        NSIndexPath *indexPath = input[1];
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        return [RACSignal empty];
    }];
    
    self.goodsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        DDGoodsDetailViewModel *viewModel = [[DDGoodsDetailViewModel alloc] initWithTitle:@"商品详情"];
        viewModel.goodsModel = (DDGoodsModel *)input;
        self.naviImpl.className = @"DDGoodsDetailController";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}

- (NSMutableDictionary *)dataDic
{
    if (!_dataDic)
    {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}
@end
