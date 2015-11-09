//
//  MANYZhiModel.h
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"

@class MANYZhiStoryModel,MANYZhiTopModel;
@interface MANYZhiModel : BaseModel


@property (nonatomic, copy) NSString *date;

@property (nonatomic, strong) NSArray<MANYZhiStoryModel *> *stories;

@property (nonatomic, strong) NSArray<MANYZhiTopModel *> *top_stories;

@end

@interface MANYZhiStoryModel : NSObject

@property (nonatomic, strong) NSString *iD;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, copy) NSString *ga_prefix;

@end

@interface MANYZhiTopModel : NSObject

@property (nonatomic, strong) NSString *iD;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *ga_prefix;

@end

