//
//  MANYHomeController.m
//  MANY
//
//  Created by 金顺度 on 15/11/4.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYHomeController.h"
#import "MANYHomeCell.h"
#import "MANYHomeViewModel.h"
@interface MANYHomeController ()<iCarouselDelegate,iCarouselDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)MANYHomeCell *cell;
@property (nonatomic,strong)MANYHomeViewModel *homeVM;

@property (nonatomic)NSInteger row;

@end

@implementation MANYHomeController

- (MANYHomeViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [MANYHomeViewModel new];
    }
    return _homeVM;
}
- (iCarousel *)ic {
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = iCarouselTypeRotary;
        _ic.autoscroll = 0;
        _ic.pagingEnabled = YES;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addNaviBarToSuperView:self.view withTarget:self];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(128, 0, 0, 0));
    }];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [MANYTool getInterFaceWithIc:self.ic usingViewModel:self.homeVM atSuperView:self.view withRow:1];
    self.row = 1;

}
#pragma mark - iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 10;
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
    tableView.nightBackgroundColor = kRGBColor(40, 40, 40);
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    return view;
}
#pragma mark - iCarouselDelegate
- (void)carouselDidScroll:(iCarousel *)carousel {
#warning 开始滑动时触发，在这里设置下一页的内容
    NSLog(@"滑动");
}
static int dex = 0;
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
#warning 切换界面需要更加平滑，或先加载几组数据存起来
//    NSLog(@"%ld,%d",carousel.currentItemIndex,dex);
    if (carousel.currentItemIndex > dex) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.homeVM getMoreDataWithRow:++self.row CompletionHandle:^(NSError *error) {
                [self.ic reloadData];
            }];
        });
        dex = (int)carousel.currentItemIndex;
    }else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.homeVM getMoreDataWithRow:--self.row CompletionHandle:^(NSError *error) {
                [self.ic reloadData];
            }];
        });
        dex = (int)carousel.currentItemIndex;
    }
}
/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return NO;
    }
    return value;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MANYHomeCell" owner:self options:nil] lastObject];
        cell.backgroundColor = [UIColor clearColor];
    }
    //设置cell不会被点击，但是上面的button能够被相应
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.cell = cell;
    [self configureCell];
    return cell;
}
- (void)configureCell {
    self.cell.hpTitleLB.text = [self.homeVM getStrHpTitle];
    [self.cell.homeImage sd_setImageWithURL:[self.homeVM getThumbnailUrl]];
    self.cell.contentLB.text = [self.homeVM getStrContent];
    [self.cell.pnBtn setTitle:[self.homeVM getStrPn].stringValue forState:UIControlStateNormal];
    self.cell.zuozheLB.text = [[self.homeVM getStrAuther]componentsSeparatedByString:@"&"][0];
    self.cell.zuopinLB.text = [[self.homeVM getStrAuther]componentsSeparatedByString:@"&"][1];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd&MMM ,yyyy"];
    NSString *dateStr = [formatter stringFromDate:[MANYTool dateFromString:[self.homeVM getStrMarketTime]]];
    NSArray *arr = [dateStr componentsSeparatedByString:@"&"];
    self.cell.dayLB.text = arr[0];
    self.cell.dayLB.textColor = myTintRGB;
    self.cell.monthyearLB.text = arr[1];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWindowH;
}

@end
