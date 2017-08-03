//
//  DDHomeHeadView.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDHomeHeadView.h"
#import "DDHomeBannerCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DDHomeHeadView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *imageArray;

@end

@implementation DDHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _btnSubject = [RACSubject subject];
        _bannerSubject = [RACSubject subject];
        [self configView];
    }
    return self;
}

- (void)configView {
    [self addSubview:self.collectionView];
    @weakify(self);
    NSArray *nameArray = @[@"home_food",@"home_fruit",@"home_living_goods",@"home_help_buy"];
    NSArray *lableArray = @[@"酒库",@"推荐有奖",@"酒卷",@"订单"];
    float buttonW = 50;
    for (int i = 0; i<4; i++) {
        float columnInterval = (kWidth - 200)/5.0;
        
        float x = columnInterval+(buttonW+columnInterval)*i;
        float y = self.collectionView.frame.size.height + 10;
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 100 + i;
        button.frame = CGRectMake( x, y , 45, 45);
        [button setBackgroundImage:[UIImage imageNamed:nameArray[i]] forState:UIControlStateNormal];
        
        [self addSubview:button];
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(button.frame.origin.x - 2.5, y + 45 + 3, button.frame.size.width + 5, 20);
        label.font = [UIFont ddNormalFont:12];
        label.text = lableArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self);
            UIButton *btn = x;
            [self.btnSubject sendNext:[NSNumber numberWithInteger:btn.tag]];
        }];
    }
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    self.imageArray = bannerArray.mutableCopy;
    id lastObj = [bannerArray lastObject];
    id firstObj = [bannerArray firstObject];
    [self.imageArray insertObject:lastObj atIndex:0];
    [self.imageArray addObject:firstObj];
    [self.collectionView reloadData];
    self.collectionView.contentOffset = CGPointMake(kWidth, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDHomeBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.jiuyunda.net:90%@",self.imageArray[indexPath.row][@"img"]]];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"headPlaceholder.jpg"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.bannerSubject sendNext:[NSNumber numberWithInteger:indexPath.item-1]];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kWidth, kWidth * 122 / 320.0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kWidth * 122 / 320.0) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"DDHomeBannerCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
@end
