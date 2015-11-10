//
//  MANYImageView.m
//  MANY
//
//  Created by 金顺度 on 15/11/10.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYImageView.h"

@implementation MANYImageView

-(id)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}


@end
