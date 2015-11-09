//
//  MANYZhiController.m
//  MANY
//
//  Created by 金顺度 on 15/11/9.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYZhiController.h"
#import "MANYZhiCell.h"
#import "MANYZhiViewModel.h"

@interface MANYZhiController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger section;

@property (nonatomic,strong) MANYZhiViewModel *zhiVM;
@property (nonatomic,strong) MANYZhiCell *cell;

@end

@implementation MANYZhiController
-(MANYZhiViewModel *)zhiVM {
    if (!_zhiVM) {
        _zhiVM = [[MANYZhiViewModel alloc]init];
    }
    return _zhiVM;
}
- (NSInteger)section {
    if (!_section) {
        _section = 1;
    }
    return _section;
}
kRemoveCellSeparator
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MANYZhiCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.zhiVM refreshDataWithRow:0 CompletionHandle:^(NSError *error) {
            self.section = 1;
            [self.tableView reloadData];
            NSLog(@"");
            [self.tableView.header endRefreshing];
        }];
    }];
//    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        [self.zhiVM getMoreDataWithRow:0 CompletionHandle:^(NSError *error) {
//            self.section += 1;
//            [self.tableView reloadData];
//            NSLog(@"");
//            [self.tableView.footer endRefreshing];
//        }];
//    }];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDataSource
//static int section = 1;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.section;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.zhiVM.zhiListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANYZhiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MANYZhiCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.titleLb.text = [self.zhiVM getTitleForRow:indexPath.row];
    [cell.imgView setImageWithURL:[self.zhiVM getImageForRow:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
