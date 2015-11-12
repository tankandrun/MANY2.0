//
//  MANYLoginViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/11.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYLoginViewController.h"
#import "UMSocial.h"

@interface MANYLoginViewController ()
@property (nonatomic,strong) UIButton *weiboIn;
@property (nonatomic,strong) UIButton *qqIn;
@property (nonatomic,strong) MANYImageView *bigLOGO;
@end

@implementation MANYLoginViewController
- (UIButton *)weiboIn {
    if (!_weiboIn) {
        _weiboIn = [[UIButton alloc]init];
        [_weiboIn setTitle:@"Log In By Weibo" forState:UIControlStateNormal];
        [self.view addSubview:_weiboIn];
        [_weiboIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            make.top.mas_equalTo(self.bigLOGO.mas_bottom).mas_equalTo(0);
        }];
        [_weiboIn setBackgroundColor:[UIColor redColor]];
        [_weiboIn bk_addEventHandler:^(id sender) {
            NSLog(@"Log In By Weibo");
            
            UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
            
            snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
                
                //          获取微博用户名、uid、token等
                
                if (response.responseCode == UMSResponseCodeSuccess) {
                    
                    UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
                    
                    NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                    
                }});
            
            
            
            
            
            
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _weiboIn;
}
- (UIButton *)qqIn {
    if (!_qqIn) {
        _qqIn = [[UIButton alloc]init];
        [_qqIn setTitle:@"Log In By QQ" forState:UIControlStateNormal];
        [self.view addSubview:_qqIn];
        [_qqIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            make.top.mas_equalTo(self.weiboIn.mas_bottom).mas_equalTo(30);
        }];
        [_qqIn setBackgroundColor:[UIColor redColor]];
        [_qqIn bk_addEventHandler:^(id sender) {
            NSLog(@"Log In By QQ");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqIn;
}
- (MANYImageView *)bigLOGO {
    if (!_bigLOGO) {
        _bigLOGO = [[MANYImageView alloc]init];
        _bigLOGO.imageView.image = [UIImage imageNamed:@"BigLOGO"];
        [self.view addSubview:_bigLOGO];
        [_bigLOGO mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(375, 375));
            make.top.mas_equalTo(64);
        }];
    }
    return _bigLOGO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    self.view.backgroundColor = kRGBColor(245, 244, 240);
    // Do any additional setup after loading the view.
    self.weiboIn.hidden = NO;
    self.qqIn.hidden = NO;
    self.bigLOGO.hidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
