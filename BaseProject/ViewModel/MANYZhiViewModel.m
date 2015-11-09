//
//  MANYZhiViewModel.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiViewModel.h"
#import "MANYZhiNetManager.h"
@interface MANYZhiViewModel ()
@property (nonatomic,strong) NSString *date;

@end

@implementation MANYZhiViewModel

- (NSMutableArray *)zhiDataArr {
    if (!_zhiDataArr) {
        _zhiDataArr = [NSMutableArray new];
    }
    return _zhiDataArr;
}
- (NSMutableArray *)zhiListArr {
    if (!_zhiListArr) {
        _zhiListArr = [NSMutableArray new];
    }
    return _zhiListArr;
}
- (NSString *)getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    return date;
}
- (NSString *)getBeforeDateWithDay:(NSInteger)day {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *date = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:day*oneDay]];
    return date;
}
#pragma 获得数据
- (MANYZhiTopModel *)topModelForArr:(NSArray *)arr row:(NSInteger)row {
    return arr[0][row];
}
- (NSURL *)getTopImageForRow:(NSInteger)row {
    return [NSURL URLWithString:[self topModelForArr:self.zhiDataArr row:row].image];
}
- (NSString *)getTopTitleForRow:(NSInteger)row {
    return [self topModelForArr:self.zhiDataArr row:row].title;
}
- (NSString *)getTopIdForRow:(NSInteger)row {
    return [self topModelForArr:self.zhiDataArr row:row].iD;
}


- (MANYZhiListStoryModel *)listModelForArr:(NSArray *)arr row:(NSInteger)row {
    return arr[row];
}
- (NSURL *)getImageForRow:(NSInteger)row {
    return [NSURL URLWithString:[self listModelForArr:self.zhiListArr row:row].images[0]];
}
- (NSString *)getIdForRow:(NSInteger)row {
    return [self listModelForArr:self.zhiListArr row:row].iD;
}
- (NSString *)getTitleForRow:(NSInteger)row {
    return [self listModelForArr:self.zhiListArr row:row].title;
}

#pragma 请求TOP的数据
//获取更多数据
static int day = 0;
- (void)getMoreDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle {
    self.date = [self getBeforeDateWithDay:day];
    [self getListDataFromNetCompleteHandle:completionHandle];
    day++;
}
//刷新
- (void)refreshDataWithRow:(NSInteger)row CompletionHandle:(CompletionHandle)completionHandle {
    [self getTopDataFromNetCompleteHandle:completionHandle];
    self.date = [self getBeforeDateWithDay:day];
    [self getListDataFromNetCompleteHandle:completionHandle];
}
//获取数据
- (void)getTopDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    [MANYZhiNetManager getTopDataCompletionHandle:^(MANYZhiModel *model, NSError *error) {
        [self.zhiDataArr removeAllObjects];
        [self.zhiDataArr addObject:model.top_stories];
        completionHandle(error);
    }];
}
- (void)getListDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    [MANYZhiNetManager getListWithDate:self.date completionHandle:^(MANYZhiListModel *model, NSError *error) {
        if ([[self getCurrentDate] isEqualToString:self.date]) {
            [self.zhiListArr removeAllObjects];
        }
        NSLog(@"");
        for (int i = 0; i<model.stories.count; i++) {
            [self.zhiListArr addObject:model.stories[i]];
        }
        completionHandle(error);
    }];
    
}
@end
