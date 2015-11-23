//
//  MANYMovieDetailModel.h
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"

@class MovieDetailModel,Images,Rating,Casts,AnotherAvatars,Directors,Avatars;
@interface MANYMovieDetailModel : BaseModel

@property (nonatomic, strong) NSArray<MovieDetailModel *> *subjects;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger start;

@end
@interface MovieDetailModel : NSObject

@property (nonatomic, strong) Rating *rating;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *original_title;

@property (nonatomic, assign) NSInteger collect_count;

@property (nonatomic, strong) NSArray<Directors *> *directors;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, strong) NSArray<Casts *> *casts;

@property (nonatomic, strong) NSArray<NSString *> *genres;

@property (nonatomic, strong) Images *images;

@property (nonatomic, copy) NSString *subtype;

@property (nonatomic, copy) NSString *alt;

@end

@interface Images : NSObject

@property (nonatomic, copy) NSString *small;

@property (nonatomic, copy) NSString *large;

@property (nonatomic, copy) NSString *medium;

@end

@interface Rating : NSObject

@property (nonatomic, copy) NSString *stars;

@property (nonatomic, assign) CGFloat average;

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, assign) NSInteger max;

@end

@interface Caasts : NSObject

@property (nonatomic, copy) NSString *iD;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) AnotherAvatars *avatars;

@property (nonatomic, copy) NSString *name;

@end

@interface AnotherAvatars : NSObject

@property (nonatomic, copy) NSString *small;

@property (nonatomic, copy) NSString *large;

@property (nonatomic, copy) NSString *medium;

@end

@interface Directors : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) Avatars *avatars;

@property (nonatomic, copy) NSString *name;

@end

@interface Avatars : NSObject

@property (nonatomic, copy) NSString *small;

@property (nonatomic, copy) NSString *large;

@property (nonatomic, copy) NSString *medium;

@end

