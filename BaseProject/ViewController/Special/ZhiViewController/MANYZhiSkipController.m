//
//  MANYZhiSkipController.m
//  MANY
//
//  Created by 金顺度 on 15/11/11.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiSkipController.h"

@interface MANYZhiSkipController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) NSURLRequest *request;

@end

@implementation MANYZhiSkipController
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        _webView.delegate = self;
    }
    return _webView;
}


- (id)initWithRequest:(NSURLRequest *)request {
    if (self = [super init]) {
        self.request = request;
        self.hidesBottomBarWhenPushed = YES;
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    [self.webView loadRequest:self.request];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [SVProgressHUD dismiss];
    self.tabBarController.tabBar.hidden = YES;
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType != 5) {
        MANYZhiSkipController *detailVC=[[MANYZhiSkipController alloc] initWithRequest:request];
        [self.navigationController pushViewController:detailVC animated:YES];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    [SVProgressHUD dismiss];
    NSLog(@"Fail:%@",error.userInfo);
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
