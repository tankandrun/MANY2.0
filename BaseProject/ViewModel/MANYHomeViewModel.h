//
//  MANYHomeViewModel.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYHomeModel.h"
@interface MANYHomeViewModel : BaseViewModel
@property (nonatomic)NSInteger row;
@property (nonatomic)NSInteger strRow;

@property(nonatomic,strong) NSMutableArray *homeDataArr;
- (MANYHomeHpEntityModel *)getModel;

- (NSString *)getStrHpTitle;
- (NSURL *)getThumbnailUrl;
- (NSString *)getStrAuther;
- (NSString *)getStrContent;
- (NSNumber *)getStrPn;
- (NSString *)getStrMarketTime;


@end
