//
//  MANYMovieDetailController.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieDetailController.h"

@interface MANYMovieDetailController ()
@property (nonatomic,strong) UIView *bottomBar;
@end

@implementation MANYMovieDetailController
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
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bottomBar.hidden = NO;
    

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
