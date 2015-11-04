//
//  MANYHomeViewModel.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYHomeViewModel.h"
#import "MANYNetManager.h"
@implementation MANYHomeViewModel
//static int row = 0;
- (NSInteger)row {
    if (!_row) {
        _row = 0;
    }
    return _row;
}

- (NSMutableArray *)homeDataArr {
    if (!_homeDataArr) {
        _homeDataArr = [NSMutableArray new];
    }
    return _homeDataArr;
}
- (NSString *)getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    return date;
}
- (MANYHomeHpEntityModel *)getModel {
    if (_row == 0) {
        return nil;
    }else {
        return self.homeDataArr[_row-1];
    }
}
#pragma mark - 获得数据
- (NSString *)getStrHpTitle {
    return [self getModel].strHpTitle;
}
- (NSURL *)getThumbnailUrl {
    return [NSURL URLWithString:[self getModel].strThumbnailUrl];
}
- (NSString *)getStrAuther {
    return [self getModel].strAuthor;
}
- (NSString *)getStrContent {
    return [self getModel].strContent;
}
- (NSNumber *)getStrPn {
    return [self getModel].strPn;
}
- (NSString *)getStrMarketTime {
    return [self getModel].strMarketTime;
}
#pragma mark - 请求数据
//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    if (_row == 11) {
        NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:nil];
        completionHandle(error);
    }else {
        _row += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _row = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    [MANYNetManager getHomeWithDate:[self getCurrentDate] row:_row completionHandle:^(MANYHomeModel *model, NSError *error) {
        
        if (_row == 1) {
            [self.homeDataArr removeAllObjects];
        }
                
        [self.homeDataArr addObject:model.hpEntity];
        
        completionHandle(error);
    }];
}
@end
