//
//  MANYMovieViewController.m
//  MANY
//
//  Created by 金顺度 on 15/11/16.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYMovieViewController.h"
#import "MANYMovieViewModel.h"

@interface MANYMovieViewController ()
@property (nonatomic,strong) MANYMovieViewModel *moviewVM;

@end

@implementation MANYMovieViewController
- (MANYMovieViewModel *)moviewVM {
    if (!_moviewVM) {
        _moviewVM = [MANYMovieViewModel new];
    }
    return _moviewVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
   
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
