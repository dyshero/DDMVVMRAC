//
//  DDHomeCollectionView.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDHomeViewModel;
@interface DDHomeCollectionView : UICollectionView
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSArray *headArray;
@property (nonatomic,weak)DDHomeViewModel *viewModel;
@end
