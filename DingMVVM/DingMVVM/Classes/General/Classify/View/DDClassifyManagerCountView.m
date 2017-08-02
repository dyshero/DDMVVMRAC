//
//  DDClassifyManagerCountView.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyManagerCountView.h"
#import "DDGoodsModel.h"

@interface DDClassifyManagerCountView ()
@property (nonatomic, strong) UIButton *ddLeftButton;
@property (nonatomic, strong) UIButton *ddRightButton;
@property (nonatomic, strong) UILabel *ddNumLable;
@property (nonatomic, assign) NSInteger stokeNum;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) DDGoodsModel *goodsModel;
@end

@implementation DDClassifyManagerCountView
- (instancetype)init {
    if (self = [super init]) {
        self.addSubject = [RACSubject subject];
        [self configView];
    }
    return self;
}

- (void)configView {
    CGFloat subviesH = 40;
    CGFloat subviewW = 30;
    self.backgroundColor            = [UIColor clearColor];
    _ddLeftButton                  = [UIButton buttonWithType:UIButtonTypeCustom];
    _ddLeftButton.backgroundColor  = [UIColor clearColor];
    _ddLeftButton.layer.masksToBounds=YES;
    _ddLeftButton.layer.cornerRadius=subviesH/2;
    _ddLeftButton.frame = (CGRect){0, 0, subviesH, subviesH};
    [_ddLeftButton addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_ddLeftButton];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage newImageWithNamed:@"minusbutton_icon" size:(CGSize){30,30}]];
    imageView1.frame = CGRectMake(10, 5, 30, 30);
    [_ddLeftButton addSubview:imageView1];
    
    
    //2.添加一个中间的显示选择数量的label
    _ddNumLable                    = [[UILabel alloc]init];
    _ddNumLable.frame              = (CGRect){ subviesH, 5 , subviewW, subviewW};
    _ddNumLable.textAlignment      = NSTextAlignmentCenter;
    _ddNumLable.textColor          = [UIColor colorWithRed:40 / 255.0 green:40 / 255.0 blue:40 / 255.0 alpha:1];
    _ddNumLable.font               = [UIFont ddNormalFont:16];
    _ddNumLable.text               = @"";
    [self addSubview:_ddNumLable];
    
    //3.添加一个右边的加号按钮
    _ddRightButton                 = [UIButton buttonWithType:UIButtonTypeCustom];
    _ddRightButton.backgroundColor = [UIColor clearColor];
    _ddRightButton.layer.masksToBounds = YES;
    _ddRightButton.layer.cornerRadius = subviesH/2;
    _ddRightButton.tag = 500;
    _ddRightButton.frame = (CGRect){ subviesH+subviewW, 0, subviesH, subviesH };
    [_ddRightButton addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_ddRightButton];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage newImageWithNamed:@"plusbutton_icon" size:(CGSize){30,30}]];
    imageView2.frame = CGRectMake(0, 5, 30, 30);
    [_ddRightButton addSubview:imageView2];
    
    _ddLeftButton.hidden = YES;
    _ddNumLable.hidden = YES;
}

- (void)leftBtnClick:(UIButton *)sender {
    
}

- (void)rightBtnClick:(UIButton *)sender {
    
}

- (void)updateGoods:(DDGoodsModel *)goods {
    self.goodsModel = goods;
    self.stokeNum = goods.stock;
    self.num = goods.num;
}

- (void)setNum:(NSInteger)num
{
    _num = num;
    if (num <= 0)
    {
        self.ddLeftButton.hidden   = YES;
        self.ddNumLable.hidden     = YES;
    }
    else
    {
        self.ddLeftButton.hidden   = NO;
        self.ddNumLable.hidden     = NO;
        self.ddNumLable.text       = [NSString stringWithFormat:@"%ld",num];
    }
}

@end
