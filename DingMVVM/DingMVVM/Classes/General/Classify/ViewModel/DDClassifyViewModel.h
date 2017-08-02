//
//  DDClassifyViewModel.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDBaseViewModel.h"

@interface DDClassifyViewModel : DDBaseViewModel
@property(nonatomic,strong)RACCommand *refreshCommand;
@property(nonatomic,strong)NSArray *leftArray;
@property (nonatomic,strong) NSMutableDictionary *dataDic;
@property(nonatomic,strong)RACCommand *leftClickCommand;
@end
