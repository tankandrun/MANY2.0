//
//  MANYMovieViewModel.h
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYMovieDetailModel.h"

@interface MANYMovieViewModel : BaseViewModel

@property (nonatomic,strong) NSMutableArray *movieList;
@property (nonatomic) NSInteger pageIndex;

- (NSURL *)getImageForItem:(NSInteger)Item;
- (NSString *)getNameForItem:(NSInteger)Item;
- (NSString *)getNameENForItem:(NSInteger)Item;
- (CGFloat)getRatingForItem:(NSInteger)Item;

@property (nonatomic,strong) MovieDetailModel *movieDetail;
- (void)getDetailDataWithName:(NSString *)name FromNetCompletionHandle:(CompletionHandle)completionHandle;

@end