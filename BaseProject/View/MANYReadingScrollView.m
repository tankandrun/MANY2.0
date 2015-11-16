//
//  MANYReadingScrollView.m
//  MANY
//
//  Created by 金顺度 on 15/11/6.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingScrollView.h"

@implementation MANYReadingScrollView

- (instancetype)init {
    if (self = [super init]) {
        [self setUpViews];
    }
    return self;
}
- (void)setUpViews {
    
    UIView *contentView = [[UIView alloc]init];
#warning scroll的高度在这里
    contentView.frame = CGRectMake(0, 0, kWindowW, 2500);
    [self addSubview:contentView];
    self.contentSize = contentView.frame.size;
    
    self.dateLB = [[UILabel alloc]init];
    self.dateLB.text = @"2015-11-11";
    self.dateLB.font = [UIFont systemFontOfSize:13];
    self.dateLB.textColor = [UIColor lightGrayColor];
    self.dateLB.nightTextColor = myNightTextRGB;
    [contentView addSubview:self.dateLB];
    [self.dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(contentView).mas_equalTo(10);
        make.height.mas_equalTo(15);
    }];
    
    self.TitleLB = [[UILabel alloc]init];
    self.TitleLB.text = @"题目";
    self.TitleLB.font = [UIFont systemFontOfSize:22];
    self.TitleLB.textColor = myTextRGB;
    self.TitleLB.nightTextColor = myNightTextRGB;
    [contentView addSubview:self.TitleLB];
    [self.TitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dateLB.mas_bottom).mas_equalTo(15);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(kWindowW-20);
    }];
    
    self.zuozheLB = [[UILabel alloc]init];
    self.zuozheLB.text = @"作者";
    self.zuozheLB.font = [UIFont systemFontOfSize:14];
    self.zuozheLB.textColor = myTextRGB;
    self.zuozheLB.nightTextColor = myNightTextRGB;
    [contentView addSubview:self.zuozheLB];
    [self.zuozheLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TitleLB.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(kWindowW-20);
    }];
    
#warning contentTV需要配置，无法控制高度
    self.contentTV = [[UITextView alloc]init];
    self.contentTV.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    self.contentTV.editable = NO;
    self.contentTV.scrollEnabled = NO;
//    self.contentTV.backgroundColor = [UIColor redColor];
    [self addSubview:self.contentTV];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.zuozheLB.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.width.mas_equalTo(kWindowW-20);
        make.height.mas_equalTo(2000);
    }];
    
    self.introduceLB = [[UILabel alloc]init];
    self.introduceLB.text = @"introduce";
    self.introduceLB.font = [UIFont systemFontOfSize:15];
    self.introduceLB.textColor = myTextRGB;
    self.introduceLB.nightTextColor = myNightTextRGB;
    self.introduceLB.numberOfLines = 0;
    [contentView addSubview:self.introduceLB];
    [self.introduceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentTV.mas_bottom).mas_equalTo(25);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.width.mas_equalTo(kWindowW-20);
    }];
    
    self.pnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pnButton setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
    [self.pnButton setImage:[UIImage imageNamed:@"home_like_hl"] forState:UIControlStateSelected];
    [self.pnButton setTitle:@"12345" forState:UIControlStateNormal];
    self.pnButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.pnButton setTitleColor:myTextRGB forState:UIControlStateNormal];
    [self.pnButton setNightTColorN:myNightTextRGB];
    [contentView addSubview:self.pnButton];
    [self.pnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.introduceLB.mas_bottom).mas_equalTo(30);
        make.left.mas_equalTo(kWindowW-55);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    self.pnButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.pnButton bk_addEventHandler:^(id sender) {
        NSLog(@"点赞");
        self.pnButton.selected = !self.pnButton.isSelected;
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *btnBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_likeBg"]];
    [contentView addSubview:btnBg];
    [btnBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(self.pnButton);
        make.left.mas_equalTo(kWindowW-60);
        make.width.mas_equalTo(60);
    }];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    [contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btnBg.mas_bottom).mas_equalTo(30);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.width.mas_equalTo(kWindowW-20);
        make.height.mas_equalTo(1);
    }];
    
    self.dazuozheLB = [[UILabel alloc]init];
    self.dazuozheLB.text = @"作者";
    self.dazuozheLB.font = [UIFont systemFontOfSize:22];
    self.dazuozheLB.textColor = myTextRGB;
    self.dazuozheLB.nightTextColor = myNightTextRGB;
    [contentView addSubview:self.dazuozheLB];
    [self.dazuozheLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.height.mas_equalTo(25);
    }];
    
    self.zuozheweiboLB = [[UILabel alloc]init];
    self.zuozheweiboLB.text = @"@作者";
    self.zuozheweiboLB.font = [UIFont systemFontOfSize:12];
    self.zuozheweiboLB.textColor = [UIColor lightGrayColor];
    [contentView addSubview:self.zuozheweiboLB];
    [self.zuozheweiboLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dazuozheLB.mas_right).mas_equalTo(5);
        make.height.mas_equalTo(15);
        make.bottomMargin.mas_equalTo(self.dazuozheLB.mas_bottomMargin);
    }];
    
    self.zuozheIntroLB = [[UILabel alloc]init];
    self.zuozheIntroLB.text = @"作者介绍";
    self.zuozheIntroLB.font = [UIFont systemFontOfSize:15];
    self.zuozheIntroLB.textColor = myTextRGB;
    self.zuozheIntroLB.nightTextColor = myNightTextRGB;
    self.zuozheIntroLB.numberOfLines = 0;
    [contentView addSubview:self.zuozheIntroLB];
    [self.zuozheIntroLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dazuozheLB.mas_bottom).mas_equalTo(25);
        make.left.mas_equalTo(contentView).mas_equalTo(10);
        make.width.mas_equalTo(kWindowW-20);
    }];

}

@end
