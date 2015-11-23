//
//  MANYMovieDetail.m
//  MANY
//
//  Created by 金顺度 on 15/11/20.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieDetail.h"
#import "MANYCasts.h"

@implementation MANYMovieDetail
//- (NSMutableArray *)tags {
//    if (!_tags) {
//        _tags = [NSMutableArray new];
//    }
//    return _tags;
//}
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
    [self addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.mainImage.mas_bottom).mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    UILabel *tag = [[UILabel alloc]init];
    tag.text = @"类型:";
    tag.textColor = [UIColor whiteColor];
    [tagView addSubview:tag];
    [tag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(45);
    }];
    self.tagButton1 = [[UIButton alloc]init];
    [self.tagButton1 setTitle:@"类型" forState:UIControlStateNormal];
    self.tagButton1.backgroundColor = kRGBColor(0, 197, 92);
    [self addSubview:self.tagButton1];
    [self.tagButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tagView).mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.left.mas_equalTo(tag.mas_right).mas_equalTo(10);
    }];
    [self.tagButton1 bk_addEventHandler:^(id sender) {
        NSLog(@"%d",1);
    } forControlEvents:UIControlEventTouchUpInside];
    self.tagButton2 = [[UIButton alloc]init];
    [self.tagButton2 setTitle:@"类型" forState:UIControlStateNormal];
    self.tagButton2.backgroundColor = kRGBColor(0, 197, 92);
    [self addSubview:self.tagButton2];
    [self.tagButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tagView).mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.left.mas_equalTo(self.tagButton1.mas_right).mas_equalTo(10);
    }];
    [self.tagButton2 bk_addEventHandler:^(id sender) {
        NSLog(@"%d",1);
    } forControlEvents:UIControlEventTouchUpInside];
    self.tagButton3 = [[UIButton alloc]init];
    [self.tagButton3 setTitle:@"类型" forState:UIControlStateNormal];
    self.tagButton3.backgroundColor = kRGBColor(0, 197, 92);
    [self addSubview:self.tagButton3];
    [self.tagButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tagView).mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.left.mas_equalTo(self.tagButton2.mas_right).mas_equalTo(10);
    }];
    [self.tagButton3 bk_addEventHandler:^(id sender) {
        NSLog(@"%d",1);
    } forControlEvents:UIControlEventTouchUpInside];
    
    
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
    [self addSubview:castsView];
    [castsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).mas_equalTo(10);
        make.topMargin.mas_equalTo(self.directorImage.mas_topMargin);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(160);
    }];
    self.castsScroll = [[UIScrollView alloc]init];
    [castsView addSubview:self.castsScroll];
    [self.castsScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(castsView).mas_equalTo(0);
    }];
    self.castsScroll.contentSize = CGSizeMake((130.0/600*420+10)*4-10, 160);
    self.castsScroll.bounces = NO;
    self.cast1 = [[MANYCasts alloc]init];
    [self.castsScroll addSubview:self.cast1];
    [self.cast1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.castsScroll).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(130.0/600*420, 160));
    }];
    self.cast2 = [[MANYCasts alloc]init];
    [self.castsScroll addSubview:self.cast2];
    [self.cast2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.castsScroll).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(130.0/600*420, 160));
        make.left.mas_equalTo(self.cast1.mas_right).mas_equalTo(10);
    }];
    self.cast3 = [[MANYCasts alloc]init];
    [self.castsScroll addSubview:self.cast3];
    [self.cast3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.castsScroll).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(130.0/600*420, 160));
        make.left.mas_equalTo(self.cast2.mas_right).mas_equalTo(10);
    }];
    self.cast4 = [[MANYCasts alloc]init];
    [self.castsScroll addSubview:self.cast4];
    [self.cast4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.castsScroll).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(130.0/600*420, 160));
        make.left.mas_equalTo(self.cast3.mas_right).mas_equalTo(10);
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
        make.top.mas_equalTo(castsView.mas_bottom).mas_equalTo(10);
    }];
    
}
@end
