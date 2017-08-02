//
//  DDHomeCell.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDGoodsModel;

@interface DDHomeCell : UICollectionViewCell
- (void)updateGoods:(DDGoodsModel *)goods;
@end
