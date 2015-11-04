//
//  MANYHomeController.m
//  MANY
//
//  Created by 金顺度 on 15/11/4.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYHomeController.h"
#import "MANYHomeCell.h"
@interface MANYHomeController ()<iCarouselDelegate,iCarouselDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MANYHomeController

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 0;
        _ic.autoscroll = 0;
        _ic.pagingEnabled = YES;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.showsVerticalScrollIndicator = NO;
    
}
#pragma mark - iCarousel
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 5;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    }
    UITableView *tableView = [[UITableView alloc]init];
    [view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MANYHomeCell" owner:self options:nil] lastObject];
    }
    self.tableView.contentOffset = CGPointMake(0, -64);
    cell.backgroundColor = [UIColor redColor];
//    cell.userInteractionEnabled = NO;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWindowH-49;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
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
