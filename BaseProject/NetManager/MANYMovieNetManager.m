//
//  MANYMovieNetManager.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieNetManager.h"

@implementation MANYMovieNetManager

+ (id)getMovieListWithPageIndex:(NSInteger)pageIndex completionHandle:(void(^)(MANYMovieModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://api.m.mtime.cn/TopList/TopListDetailsByRecommend.api?pageIndex=%ld&pageSubAreaID=2065",pageIndex];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYMovieModel objectWithKeyValues:responseObj],error);

    }];
}

+ (id)getDetailWithTitle:(NSString *)title completionHandle:(void(^)(MANYMovieDetailModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"https://api.douban.com/v2/movie/search?q=%@",title];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYMovieDetailModel objectWithKeyValues:responseObj],error);
    }];

}

@end
