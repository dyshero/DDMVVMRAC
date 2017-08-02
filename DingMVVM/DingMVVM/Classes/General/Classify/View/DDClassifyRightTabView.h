//
//  DDClassifyRightTabView.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDClassifyViewModel;

@interface DDClassifyRightTabView : UITableView
@property(nonatomic,strong) DDClassifyViewModel *viewModel;
@property(nonatomic,strong) NSArray *sectionArray;
@property(nonatomic,strong) NSDictionary *dataDic;
@end
