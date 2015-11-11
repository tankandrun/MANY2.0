//
//  MANYMeController.m
//  MANY
//
//  Created by 金顺度 on 15/11/11.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMeController.h"
#import "MANYLoginViewController.h"
#import "MANYSettingViewController.h"
#import "MANYAboutViewController.h"

@interface MANYMeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MANYMeController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.hidden = NO;
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = myTextRGB;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"p_notLogin"];
        cell.textLabel.text = @"立即登录";
    }else if (indexPath.row == 1) {
        cell.imageView.image = [UIImage imageNamed:@"setting"];
        cell.textLabel.text = @"设置";
    }else{
        cell.imageView.image = [UIImage imageNamed:@"copyright"];
        cell.textLabel.text = @"关于";
    }
    return cell;
}
kRemoveCellSeparator
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        MANYLoginViewController *vc = [[MANYLoginViewController alloc]init];
        vc.title = @"登录";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        MANYSettingViewController *vc = [[MANYSettingViewController alloc]init];
        vc.title = @"设置";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        MANYAboutViewController *vc = [[MANYAboutViewController alloc]init];
        vc.title = @"关于";
        [self.navigationController pushViewController:vc animated:YES];
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
