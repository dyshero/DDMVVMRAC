//
//  DDMineCell.m
//  DingMVVM
//
//  Created by duodian on 2017/8/3.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDMineCell.h"
@interface DDMineCell ()
@property (weak, nonatomic) IBOutlet UILabel *d_titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *d_subTitLabel;
@end

@implementation DDMineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    self.d_titleLabel.text = title;
    if (subTitle.length <= 0)
    {
        self.d_subTitLabel.hidden = YES;
    }
    else
    {
        self.d_subTitLabel.text   = subTitle;
        self.d_subTitLabel.hidden = NO;
    }
}

@end
