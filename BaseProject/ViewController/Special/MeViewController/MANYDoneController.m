//
//  MANYDoneController.m
//  MANY
//
//  Created by 金顺度 on 15/11/23.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYDoneController.h"
#import "UMSocial.h"
#import "MANYLoginViewController.h"

@interface MANYDoneController ()

@end

@implementation MANYDoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]init];
    label.text = @"待续";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    // Do any additional setup after loading the view from its nib.
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
