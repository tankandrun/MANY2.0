//
//  MANYReadingController.m
//  MANY
//
//  Created by 金顺度 on 15/11/4.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingController.h"
#import "MANYReadingScrollView.h"
#import "MANYReadingViewModel.h"

@interface MANYReadingController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)MANYReadingScrollView *readingScroll;
@property (nonatomic,strong)MANYReadingViewModel *readingVM;

@property (nonatomic)NSInteger row;
@end

@implementation MANYReadingController
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
- (MANYReadingViewModel *)readingVM {
    if (!_readingVM) {
        _readingVM = [MANYReadingViewModel new];
    }
    return _readingVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(128, 0, 0, 0));
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    [MANYTool addNaviBarToSuperView:self.view withTarget:self];
    
    [MANYTool getInterFaceWithIc:self.ic usingViewModel:self.readingVM atSuperView:self.view withRow:1];
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
    
    MANYReadingScrollView *scrollview = [[MANYReadingScrollView alloc]init];
    self.readingScroll = scrollview;
    [view addSubview:scrollview];
    scrollview.frame = view.frame;
    scrollview.showsVerticalScrollIndicator = YES;
    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    scrollview.userInteractionEnabled = YES;
    [self configureReadingScrollView];
    
    return view;
}
#pragma mark - iCarouselDelegate
static int dex = 0;
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    NSLog(@"%ld,%d",carousel.currentItemIndex,dex);
    if (carousel.currentItemIndex > dex) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.readingVM getMoreDataWithRow:++self.row CompletionHandle:^(NSError *error) {
                [self.ic reloadData];
            }];
        });
        dex = (int)carousel.currentItemIndex;
    }else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.readingVM getMoreDataWithRow:--self.row CompletionHandle:^(NSError *error) {
                [self.ic reloadData];
            }];
        });
        dex = (int)carousel.currentItemIndex;
    }
}
#pragma mark - configureData
- (void)configureReadingScrollView {
    self.readingScroll.dateLB.text = [self.readingVM getStrContMarketTime];
    self.readingScroll.TitleLB.text = [self.readingVM getStrContTitle];
    self.readingScroll.zuozheLB.text = [self.readingVM getStrContAuthor];
    self.readingScroll.contentTV.text = [[self.readingVM getStrContent]stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    self.readingScroll.introduceLB.text = [self.readingVM getStrContAuthorIntroduce];
    [self.readingScroll.pnButton setTitle:[self.readingVM getStrPraiseNumber] forState:UIControlStateNormal];
    self.readingScroll.dazuozheLB.text = [self.readingVM getStrContAuthor];
    self.readingScroll.zuozheweiboLB.text = [self.readingVM getsWbN];
    self.readingScroll.zuozheIntroLB.text = [self.readingVM getsAuth];
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
