//
//  DDClassifyRightCell.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyRightCell.h"
#import <Masonry/Masonry.h>

@interface DDClassifyRightCell ()
@property(nonatomic,strong)UIImageView          *w_imageView;
///标题
@property(nonatomic,strong)UILabel              *w_titleLabel;
///price
@property(nonatomic,strong)UILabel              *w_priceLabel;
//销量
@property(nonatomic,strong)UILabel              *w_saleCount;
///规格
@property(nonatomic,strong)UILabel              *w_specLabel;

@property(nonatomic,strong)UILabel              *w_stokeLabel;
@end

@implementation DDClassifyRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configView];
        [self bind];
    }
    return self;
}

- (void)configView {
    @weakify(self);
    self.w_imageView            = [[UIImageView alloc]init];
    [self addSubview:self.w_imageView];
    [self.w_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(5);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    //    精选
    UILabel *desLabel           = [[UILabel alloc]init];
    desLabel.text               = @"精选";
    desLabel.textAlignment      = NSTextAlignmentCenter;
    desLabel.textColor          = THEME_COLOR;
    desLabel.font = [UIFont systemFontOfSize:11];
    desLabel.layer.cornerRadius = 3;
    desLabel.layer.borderColor  = desLabel.textColor.CGColor;
    desLabel.layer.borderWidth  = 0.5;
    desLabel.layer.masksToBounds = YES;
    [self addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.w_imageView).offset(2);
        make.left.equalTo(self.w_imageView.mas_right).offset(5);
        make.width.mas_equalTo(26);
        make.height.mas_equalTo(15);
    }];
    
    self.w_titleLabel           = [[UILabel alloc]init];
    _w_titleLabel.textColor     = DDCOLOR(70, 70, 70, 1);
    _w_titleLabel.font          = [UIFont ddNormalFont:14];
    _w_titleLabel.numberOfLines = 2;
    _w_titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_w_titleLabel sizeToFit];
    _w_titleLabel.textAlignment = NSTextAlignmentJustified;
    [self addSubview:_w_titleLabel];
    [_w_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(desLabel.mas_right).offset(1);
        make.centerY.equalTo(desLabel);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(18);
    }];
    
    self.w_priceLabel           = [[UILabel alloc]init];
    _w_priceLabel.textColor     = THEME_COLOR;
    _w_priceLabel.font          = [UIFont ddNormalFont:15];
    [_w_priceLabel sizeToFit];
    [self addSubview:self.w_priceLabel];
    [self.w_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(desLabel);
        make.bottom.equalTo(self.w_imageView);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(20);
    }];
    
    self.w_specLabel            = [[UILabel alloc]init];
    _w_specLabel.textColor      = DDCOLOR(150, 150, 150, 1);
    _w_specLabel.font           = [UIFont ddNormalFont:13];
    [self addSubview:self.w_specLabel];
    [self.w_specLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(desLabel);
        make.bottom.equalTo(self.w_priceLabel.mas_top);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(18);
    }];
    
    
    self.w_saleCount            = [[UILabel alloc]init];
    _w_saleCount.textColor      = self.w_specLabel.textColor;
    _w_saleCount.font           = self.w_specLabel.font;
    [self addSubview:self.w_saleCount];
    [self.w_saleCount mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.w_priceLabel.mas_right);
        make.centerY.equalTo(self.w_priceLabel);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
}

- (void)bind {
    
}

@end
