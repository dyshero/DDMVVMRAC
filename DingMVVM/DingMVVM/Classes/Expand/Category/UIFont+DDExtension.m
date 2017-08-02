//
//  UIFont+DDExtension.m
//  DingMVVM
//
//  Created by duodian on 2017/8/2.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "UIFont+DDExtension.h"

@implementation UIFont (DDExtension)
+(UIFont *) ddNormalFont:(CGFloat)size;
{
    if (kWidth == 320 || kWidth == 640)
    {
        return [UIFont systemFontOfSize:size - 1];
    }
    else if (kWidth == 375 || kWidth == 750)
    {
        return [UIFont systemFontOfSize:size];
    }
    else
    {
        return [UIFont systemFontOfSize:size + 1];
    }
}

+(UIFont *) ddBlodFont:(CGFloat)size
{
    if (kWidth == 320 || kWidth == 640)
    {
        return [UIFont boldSystemFontOfSize:size - 1];
    }
    else if (kWidth == 375 || kWidth == 750)
    {
        return [UIFont boldSystemFontOfSize:size];
    }
    else
    {
        return [UIFont boldSystemFontOfSize:size + 1];
    }
}
@end
