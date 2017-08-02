//
//  DDRequestManager.m
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#import "DDRequestManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation DDRequestManager
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                       withpramater:(NSDictionary *)paremater
{
    CGFloat time = arc4random()%15 / 10.0;
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlString ofType:nil]];
    
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:array];
        [subscriber sendCompleted];
        return nil;
    }]delay:time];
}

+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                     withpramater:(NSDictionary *)paremater
{
    CGFloat time = arc4random()%15 / 10.0;
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlString ofType:nil]];
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:dic];
        [subscriber sendCompleted];
        return nil;
    }] delay:time];
}
@end
