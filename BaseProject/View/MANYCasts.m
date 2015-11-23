//
//  MANYCasts.m
//  MANY
//
//  Created by 金顺度 on 15/11/23.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYCasts.h"

@implementation MANYCasts
- (instancetype)init {
    if (self = [super init]) {
        self.castsImage = [[MANYImageView alloc]init];
        [self addSubview:self.castsImage];
        self.castsImage.imageView.image = [UIImage imageNamed:@"ans_img"];
        [self.castsImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(130.0/600*420, 130));
        }];
        self.name = [[UILabel alloc]init];
        self.name.text = @"name";
        self.name.numberOfLines = 2;
        self.name.textColor = [UIColor whiteColor];
        self.name.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.castsImage.mas_leftMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.castsImage.mas_rightMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.castsImage.mas_bottom).mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
        
        UIButton *moreDetail = [[UIButton alloc]init];
        [self addSubview:moreDetail];
        [moreDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [moreDetail bk_addEventHandler:^(id sender) {
#warning 添加电影人搜索
            NSLog(@"123");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
