//
//  MANYMovieViewModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieViewModel.h"
#import "MANYMovieNetManager.h"

@implementation MANYMovieViewModel
- (NSMutableArray *)movieList {
    if (!_movieList) {
        _movieList = [NSMutableArray new];
    }
    return _movieList;
}
- (NSInteger)pageIndex {
    if (!_pageIndex) {
        _pageIndex = 1;
    }
    return _pageIndex;
}
- (MovieDetailModel *)movieDetail {
    if (!_movieDetail) {
        _movieDetail = [MovieDetailModel new];
    }
    return _movieDetail;
}
#pragma mark - 配置
- (NSURL *)getImageForItem:(NSInteger)Item {
    MoviesModel *model = self.movieList[Item];
    return [NSURL URLWithString:model.posterUrl];
}
- (NSString *)getNameForItem:(NSInteger)Item {
    MoviesModel *model = self.movieList[Item];
    return model.name;
}
- (NSString *)getNameENForItem:(NSInteger)Item {
    MoviesModel *model = self.movieList[Item];
    return model.nameEn;
}
- (CGFloat)getRatingForItem:(NSInteger)Item {
    MoviesModel *model = self.movieList[Item];
    return model.rating;
}

#pragma mark - 请求电影列表的数据
//获取更多数据
- (void)getMoreDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle  {
    self.pageIndex += 1;
    [self getDataWithPageIndex:self.pageIndex FromNetCompletionHandle:completionHandle];

}

//刷新
- (void)refreshDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle {
    self.pageIndex = 1;
    [self getDataWithPageIndex:1 FromNetCompletionHandle:completionHandle];
}

//获取数据
- (void)getDataWithPageIndex:(NSInteger)pageIndex FromNetCompletionHandle:(CompletionHandle)completionHandle {
    [MANYMovieNetManager getMovieListWithPageIndex:pageIndex completionHandle:^(MANYMovieModel *model, NSError *error) {
        
        if (pageIndex == 1) {
            [self.movieList removeAllObjects];
        }
        [self.movieList addObjectsFromArray:model.movies];
        completionHandle(error);
    }];
}
#pragma mark - 请求电影详情数据
- (void)getDetailDataWithName:(NSString *)name FromNetCompletionHandle:(CompletionHandle)completionHandle {
    [MANYMovieNetManager getDetailWithTitle:name completionHandle:^(MANYMovieDetailModel *model, NSError *error) {
        self.movieDetail = model.subjects[1];
    }];
}


@end