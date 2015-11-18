//
//  MANYMovieViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/16.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieViewController.h"
#import "MANYMovieModel.h"
#import "MANYMovieViewModel.h"
#import "PSCollectionView.h"

@interface MANYMovieViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate,PSCollectionViewDataSource>
@property (nonatomic,strong) MANYMovieViewModel *moviewVM;
@property (nonatomic,strong) PSCollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *heightArray;

@end

@implementation MANYMovieViewController
- (CGFloat)height {
    return 0;
}
- (MANYMovieViewModel *)moviewVM {
    if (!_moviewVM) {
        _moviewVM = [MANYMovieViewModel new];
    }
    return _moviewVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView = [[PSCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.collectionViewDelegate = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.numColsPortrait = 2;
    
    

    //刷新
    [self.moviewVM refreshDataWithRow:0 CompletionHandle:^(NSError *error) {
//        NSInteger i = self.moviewVM.pageIndex;
        [self.collectionView reloadData];
        if (error) {
            [self showErrorMsg:error.description];
        }
    }];
    //加载更多
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.moviewVM getMoreDataWithRow:0 CompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.footer endRefreshing];
        }];
    }];
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return self.moviewVM.allNum;
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
   PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        cell.backgroundColor = [UIColor redColor];
        [self setUpCellInCell:cell];
    }
    
    return cell;
    
    
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
//    MoviesModel *data = [self.moviewVM.movieList objectAtIndex:index];
//    CGFloat width =data.coverWidth.floatValue;
//    CGFloat height = data.coverHeight.floatValue;
//    return (kWindowW/2 -12) *height/width;
    
    return 300;
}

- (void)setUpCellInCell:(PSCollectionViewCell *)cell {
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://img31.mtime.cn/mt/2014/03/12/145818.13256925_1280X720X2.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%f,%f",image.size.width,image.size.height);
    }];
    [cell addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.bottom.mas_equalTo(-20);
    }];
    
    
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
