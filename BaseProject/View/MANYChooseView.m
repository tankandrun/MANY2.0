//
//  MANYChooseView.m
//  MANY
//
//  Created by 金顺度 on 15/11/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYChooseView.h"

@implementation MANYChooseView

#define BtnWidth       (kWindowW-3)/4


- (instancetype)init {
    if (self = [super init]) {
        UIButton *one = [[UIButton alloc]init];
        [one setTitle:@"PIC" forState:UIControlStateNormal];
        [self addSubview:one];
        [one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(BtnWidth);
        }];
        [one setBackgroundColor:[UIColor clearColor]];
        one.titleLabel.font = [UIFont systemFontOfSize:15];
        one.titleLabel.textColor = [UIColor whiteColor];
        [one bk_addEventHandler:^(id sender) {
            NSLog(@"PIC");
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIView *lineOne = [[UIView alloc]init];
        lineOne.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineOne];
        [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(one.mas_right).mas_equalTo(0);
            make.bottom.mas_equalTo(-8);
            make.width.mas_equalTo(1);
        }];
        
        UIButton *two = [[UIButton alloc]init];
        [two setTitle:@"ART" forState:UIControlStateNormal];
        [self addSubview:two];
        [two mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(lineOne.mas_right).mas_equalTo(0);
            make.width.mas_equalTo(BtnWidth);
        }];
        [two setBackgroundColor:[UIColor clearColor]];
        two.titleLabel.font = [UIFont systemFontOfSize:15];
        two.titleLabel.textColor = [UIColor whiteColor];
        [two bk_addEventHandler:^(id sender) {
            NSLog(@"ART");
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIView *lineTwo = [[UIView alloc]init];
        lineTwo.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineTwo];
        [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(two.mas_right).mas_equalTo(0);
            make.bottom.mas_equalTo(-8);
            make.width.mas_equalTo(1);
        }];
        
        UIButton *three = [[UIButton alloc]init];
        [three setTitle:@"ZHI" forState:UIControlStateNormal];
        [self addSubview:three];
        [three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(BtnWidth);
            make.left.mas_equalTo(lineTwo.mas_right).mas_equalTo(0);
        }];
        [three setBackgroundColor:[UIColor clearColor]];
        three.titleLabel.font = [UIFont systemFontOfSize:15];
        three.titleLabel.textColor = [UIColor whiteColor];
        [three bk_addEventHandler:^(id sender) {
            NSLog(@"ZHI");
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIView *lineThree = [[UIView alloc]init];
        lineThree.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineThree];
        [lineThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(three.mas_right).mas_equalTo(0);
            make.bottom.mas_equalTo(-8);
            make.width.mas_equalTo(1);
        }];
        
        UIButton *four = [[UIButton alloc]init];
        [four setTitle:@"MOV" forState:UIControlStateNormal];
        [self addSubview:four];
        [four mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(BtnWidth);
            make.left.mas_equalTo(lineThree.mas_right).mas_equalTo(0);
        }];
        [four setBackgroundColor:[UIColor clearColor]];
        four.titleLabel.font = [UIFont systemFontOfSize:15];
        four.titleLabel.textColor = [UIColor whiteColor];
        [four bk_addEventHandler:^(id sender) {
            NSLog(@"MOV");
        } forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}


@end
