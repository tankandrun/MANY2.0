//
//  MANYZhiCell.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiCell.h"

@implementation MANYZhiCell
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.text = @"title";
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}
- (MANYImageView *)imgView {
    if (!_imgView) {
        _imgView = [[MANYImageView alloc]init];
    }
    return _imgView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.titleLb];
        [self addSubview:self.imgView];//150*120
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.right.bottom.mas_equalTo(-15);
            make.width.mas_equalTo(75);
        }];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.topMargin.mas_equalTo(self.imgView.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.imgView.mas_bottomMargin);
            make.right.mas_equalTo(self.imgView.mas_left).mas_equalTo(-15);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
