//
//  DDClassifyRightTabView.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyRightTabView.h"
#import "DDClassifyRightCell.h"
@interface DDClassifyRightTabView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DDClassifyRightTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self configView];
    }
    return self;
}

- (void)configView {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rowHeight = 90;
    [self registerClass:[DDClassifyRightCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataDic[self.sectionArray[section]];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDClassifyRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSArray *array = self.dataDic[self.sectionArray[indexPath.section]];
    DDGoodsModel *good = array[indexPath.row];
    [cell updateGood:good];
    return cell;
}

#pragma -mark 懒加载
- (NSArray *)sectionArray
{
    if (!_sectionArray)
    {
        _sectionArray = [NSArray array];
    }
    return _sectionArray;
}

- (NSDictionary *)dataDic
{
    if (!_dataDic)
    {
        _dataDic = [NSDictionary dictionary];
    }
    return _dataDic;
}
@end
