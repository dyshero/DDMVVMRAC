//
//  DDRequestManager.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDRequestManager : NSObject
///本地数据（array）
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                       withpramater:(NSDictionary *)paremater;

///本地数据（dic）
+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                     withpramater:(NSDictionary *)paremater;
@end
