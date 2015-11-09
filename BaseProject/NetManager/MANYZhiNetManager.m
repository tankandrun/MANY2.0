//
//  MANYZhiNetManager.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiNetManager.h"

@implementation MANYZhiNetManager

//http://news-at.zhihu.com/api/4/news/latest
+ (id)getTopDataCompletionHandle:(void(^)(MANYZhiModel *model,NSError *error))completionHandle {
    
    NSString *path = @"http://news-at.zhihu.com/api/4/news/latest";
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYZhiModel objectWithKeyValues:responseObj],error);
    }];
}

//http://news-at.zhihu.com/api/4/stories/before/20151110?client=0
+ (id)getListWithDate:(NSString *)date completionHandle:(void(^)(MANYZhiListModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/stories/before/%@?client=0",date];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYZhiListModel objectWithKeyValues:responseObj],error);
    }];
}


@end
