//
//  DDClassifyLeftCell.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDClassifyLeftCell.h"

@implementation DDClassifyLeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = DDCOLOR(240, 240, 240, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.backgroundColor    = selected ? [UIColor whiteColor] : DDCOLOR(242, 242, 242, 1);
    self.d_label.textColor  = selected ? THEME_COLOR : DDCOLOR(70, 70, 70, 1);
}

@end
