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
#import "iCarousel.h"
#import "MANYZhiDetailController.h"

@interface MANYZhiController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger section;

@property (nonatomic,strong) MANYZhiViewModel *zhiVM;
@property (nonatomic,strong) MANYZhiCell *cell;

@property (nonatomic,strong) iCarousel *ic;
@end

@implementation MANYZhiController {
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
- (UIView *)headView {
    [_timer invalidate];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 220)];
    
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    
    //添加底部LB
    _titleLb = [UILabel new];
    [headView addSubview:_titleLb];
    _titleLb.textColor = [UIColor whiteColor];
    _titleLb.numberOfLines = 0;
    _titleLb.font = [UIFont boldSystemFontOfSize:20];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-25);
        make.height.mas_equalTo(50);
    }];
    _titleLb.text = [self.zhiVM getTopTitleForRow:0];
    //添加pageControl
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.zhiVM.zhiDataArr.count;
    [headView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(_titleLb.mas_bottom);
    }];

    _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:0.3];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.userInteractionEnabled = NO;

    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    
    
    return headView;
}
- (MANYZhiViewModel *)zhiVM {
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
    self.navigationController.navigationBar.hidden = YES;
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(-25, 0, 0, 0));
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MANYZhiCell class] forCellReuseIdentifier:@"cell"];
    
    [self startShowView];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.zhiVM refreshDataWithRow:0 CompletionHandle:^(NSError *error) {
            self.section = 1;
            self.tableView.tableHeaderView = [self headView];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
#warning 缺少加载更多功能
//    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        [self.zhiVM getMoreDataWithRow:0 CompletionHandle:^(NSError *error) {
//            self.section += 1;
//            [self.tableView reloadData];
//            [self.tableView.footer endRefreshing];
//        }];
//    }];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [SVProgressHUD dismiss];
}
- (void)startShowView {
    UIImageView *cover = [[UIImageView alloc]init];
    cover.backgroundColor = [UIColor whiteColor];
    cover.frame = self.view.frame;
    [self.view addSubview:cover];
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.zhiVM refreshDataWithRow:0 CompletionHandle:^(NSError *error) {
                self.section = 1;
                self.tableView.tableHeaderView = [self headView];
                [self.tableView reloadData];
                [self.tableView.header endRefreshing];
                [cover removeFromSuperview];
                [SVProgressHUD dismiss];
            }];
        });
    });
}
#pragma mark - iCarouselDelegate,iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.zhiVM.zhiDataArr.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        MANYImageView *imageView = [[MANYImageView alloc]init];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    MANYImageView *imageView = (MANYImageView *)[view viewWithTag:100];
    [imageView.imageView sd_setImageWithURL:[self.zhiVM getTopImageForRow:index]];
    return view;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _titleLb.text = [self.zhiVM getTopTitleForRow:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}
/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    MANYZhiDetailController *vc = [[MANYZhiDetailController alloc]init];
    vc.showId = [self.zhiVM getTopIdForRow:index];
    [self.navigationController pushViewController:vc animated:YES];
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
    [cell.imgView.imageView sd_setImageWithURL:[self.zhiVM getImageForRow:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MANYZhiDetailController *vc = [[MANYZhiDetailController alloc]init];
    vc.showId = [self.zhiVM getIdForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
