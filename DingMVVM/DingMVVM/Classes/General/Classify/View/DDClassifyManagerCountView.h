//
//  DDClassifyManagerCountView.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDGoodsModel;

@interface DDClassifyManagerCountView : UIView
@property (nonatomic,strong) RACSubject *addSubject;
@property (nonatomic,strong) RACSubject *reduceSubject;
- (void)updateGoods:(DDGoodsModel *)goods;
@end
