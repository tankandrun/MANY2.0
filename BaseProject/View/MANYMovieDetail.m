//
//  MANYMovieDetail.m
//  MANY
//
//  Created by 金顺度 on 15/11/20.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieDetail.h"

@implementation MANYMovieDetail

- (id)init {
    if (self = [super init]) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView {
    
    self.mainImage = [[MANYImageView alloc]init];
    [self addSubview:self.mainImage];
    [self.mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(160, (160/330.0)*440));
    }];
    
    self.rating = [[UILabel alloc]init];
    self.rating.font = [UIFont boldSystemFontOfSize:50];
    self.rating.textColor = myTintRGB;
    self.rating.textAlignment = NSTextAlignmentCenter;
    self.rating.text = @"9.0";
    [self addSubview:self.rating];
    [self.rating mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mainImage.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(80, 60));
    }];
    
    self.nameCH = [[UILabel alloc]init];
    self.nameCH.textColor = [UIColor whiteColor];
    self.nameCH.text = @"asd";
    self.nameCH.numberOfLines = 2;
    self.nameCH.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.nameCH];
    [self.nameCH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mainImage.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(self.rating.mas_bottom).mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    self.nameEN = [[UILabel alloc]init];
    self.nameEN.textColor = [UIColor whiteColor];
    self.nameEN.text = @"asd";
    self.nameEN.numberOfLines = 2;
    self.nameEN.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.nameEN];
    [self.nameEN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mainImage.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(self.nameCH.mas_bottom).mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    UIView *tagView = [[UIView alloc]init];
    tagView.backgroundColor = [UIColor redColor];
    [self addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.mainImage.mas_bottom).mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    UILabel *tag = [[UILabel alloc]init];
    tag.text = @"类型:";
    [tagView addSubview:tag];
    [tag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
#warning 添加按钮
    
    self.directorImage = [[MANYImageView alloc]init];
    [self addSubview:self.directorImage];
    [self.directorImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(tagView.mas_bottom).mas_equalTo(40);
        make.size.mas_equalTo(CGSizeMake(100, 140));
    }];
    UILabel *directorLb = [[UILabel alloc]init];
    directorLb.text = @"导演:";
    directorLb.textColor = [UIColor whiteColor];
    directorLb.font = [UIFont systemFontOfSize:12];
    [self addSubview:directorLb];
    [directorLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(self.directorImage.mas_top).mas_equalTo(-5);
        make.size.mas_equalTo(CGSizeMake(30, 10));
    }];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor whiteColor];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.directorImage.mas_right).mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(1, 140+10));
        make.topMargin.mas_equalTo(self.directorImage.mas_topMargin);
    }];
    self.directorNameLb = [[UILabel alloc]init];
    self.directorNameLb.text = @"name";
    self.directorNameLb.numberOfLines = 2;
    self.directorNameLb.textColor = [UIColor whiteColor];
    self.directorNameLb.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.directorNameLb];
    [self.directorNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.directorImage.mas_bottom).mas_equalTo(5);
        make.width.mas_equalTo(100);
    }];
    
    UIView *castsView = [[UIView alloc]init];
    castsView.backgroundColor = [UIColor redColor];
    [self addSubview:castsView];
    [castsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).mas_equalTo(10);
        make.topMargin.mas_equalTo(self.directorImage.mas_topMargin);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(160);
    }];
    UILabel *castsLb = [[UILabel alloc]init];
    castsLb.text = @"演员:";
    castsLb.textColor = [UIColor whiteColor];
    castsLb.font = [UIFont systemFontOfSize:12];
    [self addSubview:castsLb];
    [castsLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(castsView.mas_leftMargin);
        make.bottomMargin.mas_equalTo(directorLb.mas_bottomMargin);
        make.size.mas_equalTo(CGSizeMake(30, 10));
    }];
    
    self.introLb = [[UILabel alloc]init];
    self.introLb.textColor = [UIColor whiteColor];
    self.introLb.font = [UIFont systemFontOfSize:12];
    self.introLb.numberOfLines = 0;
    [self addSubview:self.introLb];
    [self.introLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(castsView.mas_bottom).mas_equalTo(30);
    }];
    
}
@end
