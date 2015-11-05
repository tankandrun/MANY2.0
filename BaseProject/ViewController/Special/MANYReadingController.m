//
//  MANYReadingController.m
//  MANY
//
//  Created by 金顺度 on 15/11/4.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingController.h"

@interface MANYReadingController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)iCarousel *ic;

@property (nonatomic,strong)UIScrollView *readingScroll;

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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(128, 0, 0, 0));
    }];
    
}
#pragma mark - iCarousel
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 5;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    }
    UIScrollView *scrollview = [[UIScrollView alloc]init];
    self.readingScroll = scrollview;
    [view addSubview:self.readingScroll];
    scrollview.frame = view.frame;
    scrollview.contentSize = CGSizeMake(kWindowW, 2000);
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.backgroundColor = [UIColor greenColor];
    [self.readingScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    scrollview.userInteractionEnabled = YES;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"reading";
    label.frame = CGRectMake(0, 200, 100, 20);
    [self.readingScroll addSubview:label];
    
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
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
