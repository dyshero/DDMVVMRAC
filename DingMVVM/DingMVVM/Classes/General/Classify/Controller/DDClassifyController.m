//
//  DDClassifyController.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyController.h"
#import "DDClassifyRightTabView.h"
#import "DDClassifyLeftCell.h"

@interface DDClassifyController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) DDClassifyViewModel *viewModel;
@property (nonatomic,strong) NSArray *leftArray;

@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) DDClassifyRightTabView *rightTableView;
@end

@implementation DDClassifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self initView];
}

- (void)bindViewModel {
    [self.viewModel.refreshCommand execute:@[self.leftTableView,self.rightTableView]];
    RAC(self,leftArray) = RACObserve(self.viewModel, leftArray);
    RAC(_rightTableView,sectionArray) = RACObserve(self.viewModel, leftArray);
    RAC(_rightTableView,dataDic) = RACObserve(self.viewModel, dataDic);
}

- (void)initView
{
    [self.view addSubview:self.rightTableView];
    [self.view addSubview:self.leftTableView];
    self.leftTableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.leftTableView.rowHeight        = 45;
    [self.leftTableView registerNib:[UINib nibWithNibName:@"DDClassifyLeftCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.leftClickCommand execute:@[self.rightTableView,indexPath]];
}

#pragma mark - tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDClassifyLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    static BOOL isFirst = YES;
    if (!isFirst) {
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    isFirst = NO;
    cell.d_label.text = self.leftArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftArray.count;
}

#pragma -mark 懒加载
- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 75, kHeight - 64 - 49) style:UITableViewStylePlain];
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        _leftTableView.backgroundColor  = [UIColor clearColor];
    }
    return _leftTableView;
}

- (DDClassifyRightTabView *)rightTableView
{
    if (!_rightTableView)
    {
        _rightTableView = [[DDClassifyRightTabView alloc]initWithFrame:CGRectMake(75, 0, kWidth - 75, kHeight - 49) style:UITableViewStylePlain];
        _rightTableView.viewModel = self.viewModel;
    }
    return _rightTableView;
}
@end
