//
//  DDHomeCollectionView.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDHomeCollectionView.h"
#import "DDHomeCell.h"
#import "DDHomeHeadView.h"
#import "DDHomeViewModel.h"

@interface DDHomeCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@end

@implementation DDHomeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        [self configView];
    }
    return self;
}

- (void)configView
{
    self.backgroundColor = DDCOLOR(240, 240, 240, 1);
    self.delegate = self;
    self.dataSource = self;
    
    [self registerClass:[DDHomeCell class] forCellWithReuseIdentifier:@"cell"];
    [self registerClass:[DDHomeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell updateGoods:self.dataArray[indexPath.item]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    DDHomeHeadView *head = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    head.bannerArray = self.headArray.mutableCopy;
    @weakify(self);
    [head.bannerSubject subscribeNext:^(id x) {
        @strongify(self);
        NSInteger num = [x integerValue];
        [self.viewModel.headCommand execute:self.headArray[num]];
    }];
    [head.btnSubject subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.btnCommand execute:x];
    }];
    return head;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.headArray.count <= 0)
    {
        return CGSizeZero;
    }
    return CGSizeMake(kWidth, kWidth * 0.6);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kWidth - 30) / 2.0, (kWidth - 30) / 2.0 + 64);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


@end
