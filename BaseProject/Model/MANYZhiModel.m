//
//  MANYZhiModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiModel.h"

@implementation MANYZhiModel


+ (NSDictionary *)objectClassInArray{
    return @{@"stories" : [MANYZhiStoryModel class], @"top_stories" : [MANYZhiTopModel class]};
}

@end


@implementation MANYZhiStoryModel
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


@implementation MANYZhiTopModel
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


