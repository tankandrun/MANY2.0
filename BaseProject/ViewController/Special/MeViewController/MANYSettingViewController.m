//
//  MANYSettingViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/11.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYSettingViewController.h"
#import "MANYFeedBackController.h"
#import "UMSocial.h"

@interface MANYSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MANYSettingViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [UIView new];
    
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 3;
    }else {
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"夜间模式";
        UISwitch *nig = [[UISwitch alloc]init];
        [cell addSubview:nig];
        [nig mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(cell);
        }];
        [nig bk_addEventHandler:^(id sender) {
            if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
                [DKNightVersionManager dawnComing];
            } else {
                [DKNightVersionManager nightFalling];
            }
        } forControlEvents:UIControlEventValueChanged];
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"请给我五星好嘛，不然neng死你😘";
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"有些话请放在心里😉";
        }else {
            cell.textLabel.text = @"版本☹️";
            cell.detailTextLabel.text = @"MANY2.0";
        }
    }else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"清除缓存，手机飞起来";
        }else {
            cell.textLabel.text = @"退出当前账号";
        }
    }
    
    return cell;
}
kRemoveCellSeparator
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"🙄";
    }else if (section == 1) {
        return @"🙄";
    }else {
        return @"🙄";
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 0) {
        NSLog(@"五星好评!");
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        MANYFeedBackController *vc = [[MANYFeedBackController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        [[SDImageCache sharedImageCache] clearDisk];
        [SVProgressHUD showInfoWithStatus:@"完成"];
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        [[UMSocialDataService defaultDataService] requestUnOauthWithType:UMShareToSina  completion:^(UMSocialResponseEntity *response){
            NSLog(@"response is %@",response);
        }];
        [SVProgressHUD showInfoWithStatus:@"成功退出"];
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
