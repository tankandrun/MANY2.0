//
//  MANYZhiDetailController.m
//  MANY
//
//  Created by 金顺度 on 15/11/10.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiDetailController.h"
#import "MANYZhiSkipController.h"

@interface MANYZhiDetailController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UIImageView *cover;
@property (nonatomic,strong) UIView *bottomBar;

@end

@implementation MANYZhiDetailController
- (UIImageView *)cover {
    if (!_cover) {
        _cover = [[UIImageView alloc]init];
        _cover.frame = self.view.bounds;
        _cover.backgroundColor = [UIColor whiteColor];
    }
    return _cover;
}
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.bounces = NO;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(-85, 0, -420, 0));
        }];
        _webView.delegate = self;
    }
    return _webView;
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
        [_bottomBar addSubview:back];
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        [back bk_addEventHandler:^(id sender) {
            [self.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *next = [[UIButton alloc]init];
        [next setImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
        [_bottomBar addSubview:next];
        [next mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(back.mas_right).mas_equalTo(10);
        }];
        [next bk_addEventHandler:^(id sender) {
            NSLog(@"下一个");
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *latestOne = [[UIButton alloc]init];
        [latestOne setImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
        [_bottomBar addSubview:latestOne];
        [latestOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(next.mas_right).mas_equalTo(10);
        }];
        [latestOne bk_addEventHandler:^(id sender) {
            NSLog(@"上一个");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBar;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    [SVProgressHUD dismiss];
}
//http://daily.zhihu.com/story/7413288 文章的具体详情，html页面
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    NSString *webURL = [NSString stringWithFormat:@"http://daily.zhihu.com/story/%@",self.showId];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webURL]]];
    
    self.tabBarController.tabBar.hidden = YES;
    self.bottomBar.hidden = NO;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.view addSubview:self.cover];
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *path = [NSString stringWithFormat:@"http://daily.zhihu.com/story/%@",self.showId];
    if (![request.URL.absoluteString isEqualToString:path]) {
        MANYZhiSkipController *vc = [[MANYZhiSkipController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.cover removeFromSuperview];
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    [SVProgressHUD dismiss];
    DDLogVerbose(@"Fail:%@",error.userInfo);
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
