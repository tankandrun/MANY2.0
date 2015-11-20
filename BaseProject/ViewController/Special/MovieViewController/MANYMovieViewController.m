//
//  MANYMovieViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/19.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieViewController.h"
#import "MANYMovieViewModel.h"
#import "MANYMovieModel.h"
#import "MANYMovieDetailController.h"

@interface MANYMovieViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) MANYMovieViewModel *moviewVM;

@end

@implementation MANYMovieViewController

//static NSString * const reuseIdentifier = @"Cell";
- (MANYMovieViewModel *)moviewVM {
    if (!_moviewVM) {
        _moviewVM = [[MANYMovieViewModel alloc]init];
    }
    return _moviewVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view.
    [self.moviewVM refreshDataWithRow:0 CompletionHandle:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
    self.collectionView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.moviewVM getMoreDataWithRow:0 CompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.footer endRefreshing];
        }];
    }];
    
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.moviewVM.movieList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *imageView =(UIImageView *)[cell.contentView viewWithTag:100];
    [imageView sd_setImageWithURL:[self.moviewVM getImageForItem:indexPath.row]];
    UILabel *nameCH = (UILabel *)[cell.contentView viewWithTag:200];
    nameCH.text = [self.moviewVM getNameForItem:indexPath.row];
    UILabel *nameEN = (UILabel *)[cell.contentView viewWithTag:300];
    nameEN.text = [self.moviewVM getNameENForItem:indexPath.row];
    UILabel *rating = (UILabel *)[cell.contentView viewWithTag:400];
    rating.text = [NSString stringWithFormat:@"%.01f",[self.moviewVM getRatingForItem:indexPath.row]];
    
    return cell;
}

//四周边距，行边距，列边距，每个Cell的大小
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (kWindowW - 30)/2;
    //220*365 宽＊高
    CGFloat height = width * 705/400.0;
    return CGSizeMake(width, height);
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MANYMovieDetailController *vc = [[MANYMovieDetailController alloc]init];
    
    
    NSString *str = [self.moviewVM getNameForItem:indexPath.row];
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)str,NULL,NULL,kCFStringEncodingUTF8));
    vc.name = encodedString;
    vc.mainImage = [self.moviewVM getImageForItem:indexPath.row];
    vc.rating = [NSString stringWithFormat:@"%.01f",[self.moviewVM getRatingForItem:indexPath.row]];
    vc.intro = [self.moviewVM getIntroForItem:indexPath.row];

    vc.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    vc.view.nightBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
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



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
