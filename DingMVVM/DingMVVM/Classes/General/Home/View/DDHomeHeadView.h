//
//  DDHomeHeadView.h
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDHomeHeadView : UICollectionReusableView
@property (nonatomic,strong)NSArray *bannerArray;
@property (nonatomic,strong)RACSubject *btnSubject;
@property (nonatomic,strong)RACSubject *bannerSubject;
@end
