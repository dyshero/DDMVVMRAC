//
//  DDHomeCell.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDHomeCell.h"
#import <Masonry/Masonry.h>

@interface DDHomeCell ()
@property(nonatomic,strong)UIImageView *ddImageView;
@property(nonatomic,strong)UILabel *ddTitleLabel;
@property(nonatomic,strong)UILabel *ddDescLabel;
@property(nonatomic,strong)UILabel *ddPriceLabel;
@property(nonatomic,strong)UILabel *ddStockLabel;
@end

@implementation DDHomeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
}

- (void)configView
{
    CGFloat width = self.bounds.size.width;
    WS(weakSelf);
    UIView *bgView                  = [[UIView alloc]init];
    bgView.backgroundColor          = [UIColor whiteColor];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
        make.size.equalTo(weakSelf);
    }];
    
    self.ddImageView               = [[UIImageView alloc]init];
    [bgView addSubview:self.ddImageView];
    [self.ddImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView);
        make.top.equalTo(bgView);
        make.width.equalTo(bgView);
        make.height.equalTo(bgView.mas_width);
    }];
    
    self.ddTitleLabel              = [[UILabel alloc]init];
    _ddTitleLabel.font             = [UIFont ddNormalFont:15];
    _ddTitleLabel.textColor        = DDCOLOR(40, 40, 40, 1);
    [bgView addSubview:self.ddTitleLabel];
    [_ddTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(2);
        make.top.equalTo(weakSelf.ddImageView.mas_bottom).offset(5);
        make.width.mas_equalTo(width - 4);
        make.height.equalTo(@15);
    }];
    
    self.ddDescLabel = [[UILabel alloc]init];
    _ddDescLabel.textAlignment = NSTextAlignmentCenter;
    _ddDescLabel.font = [UIFont ddNormalFont:10];
    _ddDescLabel.textColor = THEME_COLOR;
    _ddDescLabel.layer.borderColor = THEME_COLOR.CGColor;
    _ddDescLabel.layer.borderWidth = 0.3;
    _ddDescLabel.layer.cornerRadius = 3;
    _ddDescLabel.layer.masksToBounds = YES;
    _ddDescLabel.text = @"精选";
    [bgView addSubview:_ddDescLabel];
    
    [_ddDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(2);
        make.top.equalTo(weakSelf.ddTitleLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(30 * ZOOM_SCALL);
        make.height.mas_equalTo(15);
    }];
    
    self.ddPriceLabel              = [[UILabel alloc]init];
    _ddPriceLabel.font             = [UIFont ddNormalFont:14];
    _ddPriceLabel.textColor        = THEME_COLOR;
    _ddPriceLabel.text             = @"¥135.00";
    [bgView addSubview:_ddPriceLabel];
    [_ddPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(1);
        make.top.equalTo(weakSelf.ddDescLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(100 * ZOOM_SCALL);
        make.height.equalTo(@15);
    }];
    
//    self.managerView                = [[WTKGoodManagerView alloc]init];
//    [bgView addSubview:self.managerView];
//    [self.managerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(bgView.mas_right).offset(0);
//        make.bottom.equalTo(bgView.mas_bottom).offset(-10);
//        make.width.mas_equalTo(110);
//        make.height.equalTo(@40);
//    }];
    
    self.ddStockLabel              = [[UILabel alloc]init];
    self.ddStockLabel.font         = [UIFont ddNormalFont:17];
    self.ddStockLabel.text         = @"补货中";
    self.ddStockLabel.textColor    = THEME_COLOR;
    _ddStockLabel.textAlignment    = NSTextAlignmentCenter;
    [bgView addSubview:_ddStockLabel];
//    [_ddStockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.managerView);
//        make.right.equalTo(weakSelf.managerView);
//        make.size.equalTo(weakSelf.managerView);
//    }];
}



@end
