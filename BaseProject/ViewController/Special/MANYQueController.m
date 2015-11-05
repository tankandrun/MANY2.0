//
//  MANYQueController.m
//  MANY
//
//  Created by 金顺度 on 15/11/5.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYQueController.h"

@interface MANYQueController ()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong)iCarousel *ic;

@property (nonatomic,strong)UIScrollView *queScroll;

@end

@implementation MANYQueController
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
    self.queScroll = scrollview;
    [view addSubview:self.queScroll];
    scrollview.frame = view.frame;
    scrollview.contentSize = CGSizeMake(kWindowW, 2000);
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.backgroundColor = [UIColor blueColor];
    [self.queScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    scrollview.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc]init];
    label.text = @"que";
    label.frame = CGRectMake(0, 0, 100, 20);
    [self.queScroll addSubview:label];
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
