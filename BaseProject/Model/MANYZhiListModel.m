//
//  MANYZhiListModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiListModel.h"

@implementation MANYZhiListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"stories" : [MANYZhiListStoryModel class]};
}
@end
@implementation MANYZhiListStoryModel
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"iD":@"id"};
}
@end


