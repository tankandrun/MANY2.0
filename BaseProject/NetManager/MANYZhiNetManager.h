//
//  MANYZhiNetManager.h
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseNetManager.h"
#import "MANYZhiNetManager.h"
#import "MANYZhiModel.h"
#import "MANYZhiListModel.h"
@interface MANYZhiNetManager : BaseNetManager

+ (id)getTopDataCompletionHandle:(void(^)(MANYZhiModel *model,NSError *error))completionHandle;

+ (id)getListWithDate:(NSString *)date completionHandle:(void(^)(MANYZhiListModel *model,NSError *error))completionHandle;

@end
