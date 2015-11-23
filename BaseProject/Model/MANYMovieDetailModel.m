//
//  MANYMovieDetailModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieDetailModel.h"

@implementation MANYMovieDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"subjects" : [MovieDetailModel class]};
}
@end
@implementation MovieDetailModel

+ (NSDictionary *)objectClassInArray{
    return @{@"casts" : [Caasts class], @"directors" : [Directors class]};
}

@end


@implementation Images

@end


@implementation Rating

@end


@implementation Caasts
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


@implementation AnotherAvatars

@end


@implementation Directors

@end


@implementation Avatars

@end


