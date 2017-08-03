//
//  DDMineButton.h
//  DingMVVM
//
//  Created by duodian on 2017/8/3.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDMineButton : UIButton
/**
 *  左上的提示
 */
@property(nonatomic,assign)NSInteger bageValue;
/**
 * 构建方法  最低高度65
 */
+ (instancetype)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName;
@end
