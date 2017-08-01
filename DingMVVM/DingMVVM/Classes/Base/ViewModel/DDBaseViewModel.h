//
//  DDBaseViewModel.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDBaseViewModel : NSObject
@property (nonatomic,copy) NSString *title;
- (instancetype)initWithTitle:(NSString *)title;
@end
