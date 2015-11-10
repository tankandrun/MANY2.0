//
//  MANYZhiDetailController.m
//  MANY
//
//  Created by 金顺度 on 15/11/10.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiDetailController.h"

@interface MANYZhiDetailController ()<UIWebViewDelegate>

@end

@implementation MANYZhiDetailController

//http://daily.zhihu.com/story/7413288 文章的具体详情，html页面
- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
//    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]init];
    webView.scrollView.showsVerticalScrollIndicator = NO;
    webView.scrollView.bounces = NO;
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(-85, 0, -400, 0));
    }];
    webView.delegate = self;
    NSString *webURL = [NSString stringWithFormat:@"http://daily.zhihu.com/story/%@",self.showId];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webURL]]];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    back.frame = CGRectMake(0, 20, 44, 44);
    [self.view addSubview:back];
    [back setBackgroundColor:[UIColor redColor]];
    [back bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
#warning 添加加载圈，cover
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    DDLogVerbose(@"Success");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
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
