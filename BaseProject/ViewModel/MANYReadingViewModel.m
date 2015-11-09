//
//  MANYReadingViewModel.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingViewModel.h"
#import "MANYNetManager.h"
#import "MANYTool.h"
#import "MANYReadingModel.h"
@implementation MANYReadingViewModel
//static int row = 0;
- (NSInteger)row {
    if (!_row) {
        _row = 1;
    }
    return _row;
}
- (NSMutableArray *)readingDataArr {
    if (!_readingDataArr) {
        _readingDataArr = [NSMutableArray new];
    }
    return _readingDataArr;
}
- (NSString *)getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    return date;
}
- (MANYReadingContentModel *)getModel {
    if (_row == 0) {
        return nil;
    }else {
        if (self.readingDataArr[_row-1] == nil) {
            return self.readingDataArr[_row-2];
        }else {
            return self.readingDataArr[_row-1];
        }
    }
}
#pragma mark - 获得数据
- (NSString *)getStrContMarketTime {
    return [MANYTool getBigDateFromString:[self getModel].strContMarketTime];
}
- (NSString *)getStrContent {
    return [self getModel].strContent;
}
- (NSString *)getStrContTitle {
    return [self getModel].strContTitle;
}
- (NSString *)getStrContAuthor {
    return [self getModel].strContAuthor;
}
- (NSString *)getStrContAuthorIntroduce {
    return [self getModel].strContAuthorIntroduce;
}
- (NSString *)getStrPraiseNumber {
    return [self getModel].strPraiseNumber;
}
- (NSString *)getsWbN {
    return [self getModel].sWbN;
}
- (NSString *)getsAuth {
    return [self getModel].sAuth;
}
#pragma mark - 请求数据
//获取更多
- (void)getMoreDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle {
    if (_row == 11) {
        NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:nil];
        completionHandle(error);
    }else {
        [self getDataWithRow:row FromNetCompleteHandle:completionHandle];
    }
}
//刷新
- (void)refreshDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle {
    [self getDataWithRow:row FromNetCompleteHandle:completionHandle];
//     NSLog(@"");
}
//获取数据
- (void)getDataWithRow:(NSInteger)row FromNetCompleteHandle:(CompletionHandle)completionHandle {
    [MANYNetManager getReadingWithDate:[self getCurrentDate] row:row completionHandle:^(MANYReadingModel *model, NSError *error) {
        if (row == 1) {
            [self.readingDataArr removeAllObjects];
        }
        [self.readingDataArr addObject:model.contentEntity];
        completionHandle(error);
        _row = row;
    }];
//    NSLog(@"");
}

@end
