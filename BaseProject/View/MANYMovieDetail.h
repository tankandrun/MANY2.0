//
//  MANYMovieDetail.h
//  MANY
//
//  Created by 金顺度 on 15/11/20.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MANYMovieDetail : UIView

@property (nonatomic,strong) MANYImageView *mainImage;
@property (nonatomic,strong) UILabel *rating;
@property (nonatomic,strong) UILabel *nameCH;
@property (nonatomic,strong) UILabel *nameEN;

//@property (nonatomic,strong) UIView *tagView;
@property (nonatomic,strong) NSMutableArray *tags;
@property (nonatomic,strong) MANYImageView *directorImage;
@property (nonatomic,strong) UILabel *directorNameLb;
@property (nonatomic,strong) NSMutableArray *casts;

@property (nonatomic,strong) UILabel *introLb;

@property (nonatomic,strong) UIButton *showMore;

@end
