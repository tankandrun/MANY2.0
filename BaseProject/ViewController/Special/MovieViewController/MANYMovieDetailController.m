//
//  MANYMovieDetailController.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieDetailController.h"
#import "MANYMovieViewModel.h"
#import "MANYMovieDetail.h"

@interface MANYMovieDetailController ()
@property (nonatomic,strong) UIView *bottomBar;
@property (nonatomic,strong) MANYMovieViewModel *movieVM;
@property (nonatomic,strong) MANYMovieDetail *detailView;
//毛玻璃
@property (nonatomic,strong) UIVisualEffectView *blurEffectView;
//@property (nonatomic,strong) UIScrollView *scroll;
@end

@implementation MANYMovieDetailController
#warning 需要再第二层添加竖向scrollView，detailView的约束需要更改
//- (UIScrollView *)scroll {
//    if (!_scroll) {
//        _scroll = [[UIScrollView alloc]init];
//        _scroll.frame = CGRectMake(0, 0, kWindowW, kWindowH);
//        [self.view addSubview:_scroll];
////        [_scroll mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.left.top.right.bottom.mas_equalTo(0);
////        }];
//        _scroll.contentSize = CGSizeMake(kWindowW, kWindowH+50);
//    }
//    return _scroll;
//}
- (UIVisualEffectView *)blurEffectView {
    if (!_blurEffectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
        _blurEffectView.frame = CGRectMake(0, 0, kWindowW, kWindowH-44);
    }
    return _blurEffectView;
}
- (MANYMovieDetail *)detailView {
    if (!_detailView) {
        _detailView = [[MANYMovieDetail alloc]init];
        [self.view addSubview:_detailView];
        [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(-44);
        }];
    }
    return _detailView;
}
- (MANYMovieViewModel *)movieVM {
    if (!_movieVM) {
        _movieVM = [MANYMovieViewModel new];
    }
    return _movieVM;
}
- (UIView *)bottomBar {
    if (!_bottomBar) {
        _bottomBar = [[UIView alloc]init];
        _bottomBar.backgroundColor = myTabRGB;
        [self.view addSubview:_bottomBar];
        [_bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        UIButton *back = [[UIButton alloc]init];
        [back setImage:[UIImage imageNamed:@"navBackBtn"] forState:UIControlStateNormal];
        [back setNightImageN:[UIImage imageNamed:@"navBackBtn"]];
        [_bottomBar addSubview:back];
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        [back bk_addEventHandler:^(id sender) {
            [self dismissViewControllerAnimated:YES completion:nil];
            [SVProgressHUD dismiss];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view insertSubview:self.blurEffectView atIndex:1];
//    self.scroll.hidden = NO;
    self.bottomBar.hidden = NO;
    self.detailView.hidden = NO;
    
    
    
    [SVProgressHUD show];
    self.detailView.hidden = YES;
    [self.movieVM getDetailDataWithName:self.name FromNetCompletionHandle:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.detail = self.movieVM.movieDetail;
            [self configureView];
            self.detailView.hidden = NO;
            [SVProgressHUD dismiss];
        });
    }];

}
- (void)configureView {
    self.detailView.nameCH.text = [self.movieVM getNameCH];
    self.detailView.nameEN.text = [self.movieVM getNameEN];
    [self.detailView.mainImage.imageView sd_setImageWithURL:self.mainImage];
    self.detailView.rating.text = self.rating;
    [self.detailView.directorImage.imageView sd_setImageWithURL:[self.movieVM getDirectorImage]];
    self.detailView.directorNameLb.text = [self.movieVM getDirectorName];
    self.detailView.introLb.text = [NSString stringWithFormat:@"简介:\n%@",self.intro];
#warning 按钮添加搜索更多电影功能
    [self setButtons];
    [self setCasts];
    
}
- (void)setButtons {
    NSMutableArray *tags = [NSMutableArray new];
    [tags addObjectsFromArray:[self.movieVM getTagsArray]];
    if (tags.count == 1) {
        [self.detailView.tagButton1 setTitle:tags[0] forState:UIControlStateNormal];
        self.detailView.tagButton2.hidden = YES;
        self.detailView.tagButton3.hidden = YES;
    }else if (tags.count == 2) {
        [self.detailView.tagButton1 setTitle:tags[0] forState:UIControlStateNormal];
        [self.detailView.tagButton2 setTitle:tags[1] forState:UIControlStateNormal];
        self.detailView.tagButton3.hidden = YES;
    }else {
        [self.detailView.tagButton1 setTitle:tags[0] forState:UIControlStateNormal];
        [self.detailView.tagButton2 setTitle:tags[1] forState:UIControlStateNormal];
        [self.detailView.tagButton3 setTitle:tags[2] forState:UIControlStateNormal];
    }
}
- (void)setCasts {
    NSMutableArray *casts = [NSMutableArray new];
    [casts addObjectsFromArray:[self.movieVM getCastsArray]];
    if (casts.count == 1) {
        self.detailView.castsScroll.scrollEnabled = NO;
        Caasts *cast = casts[0];
        self.detailView.cast1.name.text = cast.name;
        AnotherAvatars *ava = cast.avatars;
        [self.detailView.cast1.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava.large]];
        self.detailView.cast2.hidden = YES;
        self.detailView.cast3.hidden = YES;
        self.detailView.cast4.hidden = YES;
    }else if (casts.count == 2) {
        self.detailView.castsScroll.scrollEnabled = NO;
        Caasts *cast1 = casts[0];
        self.detailView.cast1.name.text = cast1.name;
        AnotherAvatars *ava1 = cast1.avatars;
        [self.detailView.cast1.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava1.large]];
        Caasts *cast2 = casts[1];
        self.detailView.cast2.name.text = cast2.name;
        AnotherAvatars *ava2= cast2.avatars;
        [self.detailView.cast2.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava2.large]];
        self.detailView.cast3.hidden = YES;
        self.detailView.cast4.hidden = YES;
    }else if (casts.count == 3) {
        self.detailView.castsScroll.scrollEnabled = YES;
        Caasts *cast1 = casts[0];
        self.detailView.cast1.name.text = cast1.name;
        AnotherAvatars *ava1 = cast1.avatars;
        [self.detailView.cast1.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava1.large]];
        Caasts *cast2 = casts[1];
        self.detailView.cast2.name.text = cast2.name;
        AnotherAvatars *ava2 = cast2.avatars;
        [self.detailView.cast2.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava2.large]];
        Caasts *cast3 = casts[2];
        self.detailView.cast3.name.text = cast3.name;
        AnotherAvatars *ava3 = cast3.avatars;
        [self.detailView.cast3.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava3.large]];
        self.detailView.cast4.hidden = YES;
        self.detailView.castsScroll.contentSize = CGSizeMake((130.0/600*420+10)*3-10, 160);
    }else {
        self.detailView.castsScroll.scrollEnabled = YES;
        Caasts *cast1 = casts[0];
        self.detailView.cast1.name.text = cast1.name;
        AnotherAvatars *ava1 = cast1.avatars;
        [self.detailView.cast1.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava1.large]];
        Caasts *cast2 = casts[1];
        self.detailView.cast2.name.text = cast2.name;
        AnotherAvatars *ava2 = cast2.avatars;
        [self.detailView.cast2.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava2.large]];
        Caasts *cast3 = casts[2];
        self.detailView.cast3.name.text = cast3.name;
        AnotherAvatars *ava3 = cast3.avatars;
        [self.detailView.cast3.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava3.large]];
        Caasts *cast4 = casts[3];
        self.detailView.cast4.name.text = cast4.name;
        AnotherAvatars *ava4 = cast4.avatars;
        [self.detailView.cast4.castsImage.imageView sd_setImageWithURL:[NSURL URLWithString:ava4.large]];
        self.detailView.castsScroll.contentSize = CGSizeMake((130.0/600*420+10)*4-10, 160);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
