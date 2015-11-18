//
//  MANYMovieNetManager.h
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseNetManager.h"
#import "MANYMovieModel.h"
#import "MANYMovieDetailModel.h"

@interface MANYMovieNetManager : BaseNetManager

+ (id)getMovieListWithPageIndex:(NSInteger)pageIndex completionHandle:(void(^)(MANYMovieModel *model,NSError *error))completionHandle;

+ (id)getDetailWithTitle:(NSString *)title completionHandle:(void(^)(MANYMovieDetailModel *model,NSError *error))completionHandle;

@end
