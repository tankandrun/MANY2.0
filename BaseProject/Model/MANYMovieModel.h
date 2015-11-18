//
//  MANYMovieModel.h
//  MANY
//
//  Created by 金顺度 on 15/11/16.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"

@class Toplist,Nexttoplist,Previoustoplist,MoviesModel;
@interface MANYMovieModel : BaseModel

@property (nonatomic, strong) Toplist *topList;

@property (nonatomic, strong) Previoustoplist *previousTopList;

@property (nonatomic, strong) Nexttoplist *nextTopList;

@property (nonatomic, strong) NSArray<MoviesModel *> *movies;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageCount;

@end
@interface Toplist : NSObject

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *summary;

@end

@interface Nexttoplist : NSObject

@property (nonatomic, assign) NSInteger toplistItemType;

@property (nonatomic, assign) NSInteger toplistType;

@property (nonatomic, assign) NSInteger toplistId;

@end

@interface Previoustoplist : NSObject

@property (nonatomic, assign) NSInteger toplistItemType;

@property (nonatomic, assign) NSInteger toplistType;

@property (nonatomic, assign) NSInteger toplistId;

@end

@interface MoviesModel : NSObject

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) CGFloat rating;

@property (nonatomic, copy) NSString *releaseLocation;

@property (nonatomic, assign) NSInteger rankNum;

@property (nonatomic, copy) NSString *releaseDate;

@property (nonatomic, copy) NSString *director;

@property (nonatomic, copy) NSString *posterUrl;

@property (nonatomic, assign) BOOL isPresell;

@property (nonatomic, copy) NSString *movieType;

@property (nonatomic, copy) NSString *actor;

@property (nonatomic, copy) NSString *nameEn;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) BOOL isTicket;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger decade;

@end

