//
//  DDClassifyRightTabView.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyRightTabView.h"
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
}

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
