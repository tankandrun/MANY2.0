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
@end

@implementation MANYMovieDetailController
- (MANYMovieDetail *)detailView {
    if (!_detailView) {
        _detailView = [[MANYMovieDetail alloc]init];
        [self.view addSubview:_detailView];
        [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-44);
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
