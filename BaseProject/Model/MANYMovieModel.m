//
//  MANYMovieModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/16.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieModel.h"

@implementation MANYMovieModel


+ (NSDictionary *)objectClassInArray{
    return @{@"movies" : [MoviesModel class]};
}
@end
@implementation Toplist
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


@implementation Nexttoplist

@end


@implementation Previoustoplist

@end


@implementation MoviesModel
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


