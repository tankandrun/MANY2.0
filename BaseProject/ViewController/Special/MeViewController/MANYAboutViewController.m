//
//  MANYAboutViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/11.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYAboutViewController.h"
#import "MANYSurperiseView.h"
@interface MANYAboutViewController ()
@property (nonatomic,strong) MANYSurperiseView *paintView;
@end

@implementation MANYAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden = YES;
    self.paintView = [[MANYSurperiseView alloc]init];
    self.paintView.col = [UIColor redColor];
    self.view = self.paintView;
    
    UIButton *change = [[UIButton alloc]init];
    [change setImage:[UIImage imageNamed:@"copyright_nt"] forState:UIControlStateNormal];
    [self.view addSubview:change];
    [change mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(300);
    }];
    [change bk_addEventHandler:^(id sender) {
        change.selected = !change.isSelected;
        if (change.isSelected) {
            self.paintView.col=[UIColor blackColor];
        }else {
            self.paintView.col=[UIColor redColor];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    change.hidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animate {
    [super viewWillDisappear:animate];
    self.tabBarController.tabBar.hidden = NO;
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
