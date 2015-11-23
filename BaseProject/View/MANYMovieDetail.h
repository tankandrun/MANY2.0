//
//  MANYMovieDetail.h
//  MANY
//
//  Created by 金顺度 on 15/11/20.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MANYCasts.h"

@interface MANYMovieDetail : UIView

@property (nonatomic,strong) MANYImageView *mainImage;
@property (nonatomic,strong) UILabel *rating;
@property (nonatomic,strong) UILabel *nameCH;
@property (nonatomic,strong) UILabel *nameEN;

//@property (nonatomic,strong) UIView *tagView;
//@property (nonatomic,strong) NSMutableArray *tags;
@property (nonatomic,strong) UIButton *tagButton1;
@property (nonatomic,strong) UIButton *tagButton2;
@property (nonatomic,strong) UIButton *tagButton3;

@property (nonatomic,strong) MANYImageView *directorImage;
@property (nonatomic,strong) UILabel *directorNameLb;

//@property (nonatomic,strong) NSMutableArray *casts;
@property (nonatomic,strong) UIScrollView *castsScroll;
@property (nonatomic,strong) MANYCasts *cast1;
@property (nonatomic,strong) MANYCasts *cast2;
@property (nonatomic,strong) MANYCasts *cast3;
@property (nonatomic,strong) MANYCasts *cast4;

@property (nonatomic,strong) UILabel *introLb;
#warning 还没添加
@property (nonatomic,strong) UIButton *showMore;

@end
