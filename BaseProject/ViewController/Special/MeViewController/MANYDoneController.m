//
//  MANYDoneController.m
//  MANY
//
//  Created by 金顺度 on 15/11/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYDoneController.h"
#import "UMSocial.h"
#import "MANYLoginViewController.h"
#import "MANYChooseView.h"

@interface MANYDoneController ()

@end

@implementation MANYDoneController
- (UIImageView *)userImage {
    if (!_userName) {
        _userImage = [[UIImageView alloc]init];
        [self.view addSubview:_userImage];
        [_userImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(60);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        _userImage.layer.cornerRadius = 30;
        _userImage.clipsToBounds = YES;
    }
    return _userImage;
}
- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc]init];
        [self.view addSubview:_userName];
        [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.userImage.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(20);
        }];
        _userName.textAlignment = NSTextAlignmentCenter;
        _userName.textColor = [UIColor whiteColor];
    }
    return _userName;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *background = [[UIImageView alloc]init];
    background.image = [UIImage imageNamed:@"collectionHeadBg"];
    [self.view addSubview:background];
    [background mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(235);
    }];
    
    [MANYTool addBackItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    UIButton *back = [[UIButton alloc]init];
    [back setImage:[UIImage imageNamed:@"navBackBtn"] forState:UIControlStateNormal];
    [back bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.top.mas_equalTo(22);
    }];
    
    MANYChooseView *chooseView = [[MANYChooseView alloc]init];
    [self.view addSubview:chooseView];
    [chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.left.right.mas_equalTo(0);
        make.bottomMargin.mas_equalTo(background.mas_bottomMargin).mas_equalTo(0);
    }];
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
