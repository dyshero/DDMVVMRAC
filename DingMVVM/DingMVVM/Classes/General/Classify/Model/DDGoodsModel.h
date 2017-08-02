//
//  DDGoodsModel.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDGoodsModel : NSObject
//商品的图片地址
@property (nonatomic, copy) NSString *avatar_url;
//类别
@property (nonatomic, copy) NSString *category_name;

//商品编号
@property (nonatomic, copy) NSString *id;

@property(nonatomic,assign) double marketPrice;

//价格
@property (nonatomic, assign) double price;

@property (nonatomic, strong) NSString *qrcode;

///获取商品的销量
@property (nonatomic,assign)int sale_count ;

//规格重量
@property (nonatomic, copy) NSString *specification;



@property(nonatomic,copy)NSString *state;

//库存
@property (nonatomic, assign) NSInteger stock;

@property (nonatomic, copy) NSString *tags;

//商品的tag值
@property (nonatomic, assign) int tag;

///获取商品缩略图
@property (nonatomic,retain)NSString * thumb_url;

//商品名称
@property (nonatomic, copy) NSString *title;

///添加到购物车数量
@property(nonatomic,assign)NSInteger num;

///购物车中是否选择
@property(nonatomic,assign)BOOL w_isSelected;

@property (nonatomic,copy) NSString *brand;
@end
