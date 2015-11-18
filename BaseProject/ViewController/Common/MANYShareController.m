//
//  MANYShareController.m
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYShareController.h"
#import "MANYShareView.h"
#import "UMSocial.h"

@interface MANYShareController ()<ShareViewDelegate>
@property (nonatomic,strong) MANYShareView *shareView;

@end

@implementation MANYShareController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MANYShareView *shareView = [[NSBundle mainBundle]loadNibNamed:@"MANYShareView" owner:self options:nil].firstObject;
    shareView.delegate = self;
    self.shareView = shareView;
    [self.view addSubview:shareView];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 1;
    tapGR.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGR];
    
}
- (void)tap:(UITapGestureRecognizer *)tapGR {
    CGPoint location = [tapGR locationInView:self.view];
    if (location.y <= (kWindowH-260)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark - ShareViewDelegate
- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)gotoNextView {
    if ([self.shareView.shareToWeibo isHighlighted]) {
        [[UMSocialControllerService defaultControllerService] setShareText:@"分享内嵌文字" shareImage:[UIImage imageNamed:@"icon"] socialUIDelegate:nil];        //设置分享内容和回调对象
        [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    }else if ([self.shareView.shareToWXFri isHighlighted]) {
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:@"分享内嵌文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
            }
        }];
    }else if ([self.shareView.shareToTimeLine isHighlighted]) {
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:@"分享内嵌文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
            }
        }];
    }else if ([self.shareView.shareToQQFri isHighlighted]) {
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:@"1104853793  vq90I7z9Cq5Cv4CU " image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
            }
        }];
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
