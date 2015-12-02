//
//  MANYPicDetailController.m
//  MANY
//
//  Created by 金顺度 on 15/12/1.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYPicDetailController.h"

@interface MANYPicDetailController ()

@end

@implementation MANYPicDetailController
- (UIImageView *)mainImageView {
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc]init];
        [self.view addSubview:_mainImageView];
        [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW, (260.0/667.0)*kWindowH));
        }];
    }
    return _mainImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 1;
    tapGR.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGR];
    
    UIButton *save = [[UIButton alloc]init];
    [save setImage:[UIImage imageNamed:@"share_save"] forState:UIControlStateNormal];
    [self.view addSubview:save];
    [save mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [save setBackgroundColor:[UIColor whiteColor]];
    save.layer.cornerRadius = 20;
    save.clipsToBounds = YES;
    [save bk_addEventHandler:^(id sender) {
        UIImageWriteToSavedPhotosAlbum(self.mainImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error){
        [SVProgressHUD showSuccessWithStatus:@"Save Success"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Save Failed"];
    }
}
- (void)tap:(UITapGestureRecognizer *)tapGR {
    [self dismissViewControllerAnimated:YES completion:nil];
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
