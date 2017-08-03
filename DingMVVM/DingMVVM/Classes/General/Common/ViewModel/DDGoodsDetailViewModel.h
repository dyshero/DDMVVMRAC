//
//  DDGoodsDetailViewModel.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseViewModel.h"
@class DDGoodsModel;

@interface DDGoodsDetailViewModel : DDBaseViewModel
@property (nonatomic,weak) DDGoodsModel *goodsModel;
@end
