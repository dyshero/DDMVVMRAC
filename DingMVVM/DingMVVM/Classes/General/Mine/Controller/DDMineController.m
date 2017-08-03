//
//  DDMineController.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDMineController.h"
#import "DDMineButton.h"
#import "DDMineCell.h"
#import "DDMineViewModel.h"

@interface DDMineController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)DDMineViewModel *viewModel;
@end

@implementation DDMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"推荐有奖",@"意见反馈",@"客服热线",@"酒运达"];
    [self.view addSubview:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == 0)
    {
        [cell updateTitle:@"我的订单" subTitle:@"查看全部订单"];
    }
    else if (indexPath.section == 1)
    {
        [cell updateTitle:@"我的钱包" subTitle:@"查看明细"];
    }
    else
    {
        [cell updateTitle:self.titleArray[indexPath.row] subTitle:@""];
        if (indexPath.row == 2)
        {
            [cell updateTitle:self.titleArray[indexPath.row] subTitle:@"QQ2429567641"];
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 1 : section == 1 ? 1 : 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 2 ? 0.1 : 95;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 0.05)];
    }else {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 95)];
        NSArray *titleArray = section == 0 ? @[@"待支付",@"配送中",@"已配送",@"待评价"] : @[@"积分",@"酒库",@"优惠券",@"酒券"];
        NSArray *imgArray   = section == 0 ? @[@"w_daizhifu",@"w_peisongzhong",@"w_yipeisong",@"w_daipingjia"] : @[@"w_jifen",@"w_jiuku",@"w_youhuiquan",@"w_jiuquan"];
        CGFloat height = 80;
        CGFloat width = kWidth / 4.0;
        @weakify(self);
        [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DDMineButton *btn = [DDMineButton buttonWithTitle:obj imageName:imgArray[idx]];
            btn.tag = idx;
            [btn setFrame:CGRectMake(idx * width, 0, width, height)];
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                @strongify(self);
                [self.viewModel.headClickSubject sendNext:@(idx + section * 4)];
            }];
            [footerView addSubview:btn];
            if (idx == 3 && section == 0)
            {
                btn.bageValue = 2;
            }
        }];
        UIView *bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 79.4, kWidth, 15.6)];
        bottom.backgroundColor = BASE_COLOR;
        [footerView addSubview:bottom];
        return footerView;
    }
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 49) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"DDMineCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
@end
