//
//  MANYZhiViewModel.h
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYZhiModel.h"
#import "MANYZhiListModel.h"
@interface MANYZhiViewModel : BaseViewModel

@property (nonatomic,strong) NSMutableArray *zhiDataArr;
@property (nonatomic,strong) NSMutableArray *zhiListArr;

- (NSURL *)getTopImageForRow:(NSInteger)row;
- (NSString *)getTopTitleForRow:(NSInteger)row;
- (NSString *)getTopIdForRow:(NSInteger)row;

- (NSURL *)getImageForRow:(NSInteger)row;
- (NSString *)getIdForRow:(NSInteger)row;
- (NSString *)getTitleForRow:(NSInteger)row;


@end
