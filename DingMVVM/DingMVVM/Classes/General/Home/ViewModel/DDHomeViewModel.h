//
//  DDHomeViewModel.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseViewModel.h"

@interface DDHomeViewModel : DDBaseViewModel
@property (nonatomic,strong)RACCommand *refreshCommand;
@property (nonatomic,strong)RACCommand *headCommand;
@property (nonatomic,strong)RACCommand *btnCommand;
@property(nonatomic,strong)NSArray      *headData;
@property(nonatomic,strong)NSArray      *dataArray;
@end
