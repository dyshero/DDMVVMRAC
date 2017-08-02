//
//  NSObject+Model.m
//
//  Created by 翊sky
//  Copyright (c) 翊sky. All rights reserved.
//

#import "NSObject+Model.h"

@implementation NSObject (Model)

+ (id)objectWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
    
}

- (id)initWithDict:(NSDictionary *)dict{
    
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
