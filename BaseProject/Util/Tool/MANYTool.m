//
//  MANYTool.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYTool.h"
#import "BaseViewModel.h"
#import "UIView+TYAlertView.h"
#import "TYAlertController+BlurEffects.h"
#import "MANYShareView.h"
@implementation MANYTool

+ (NSDate *)dateFromString:(NSString *)dateStr {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    [inputFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    // 标准时间
    return [inputFormatter dateFromString:dateStr];
}

+ (NSString *)getBigDateFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *date = [formatter stringFromDate:[self dateFromString:dateStr]];
    return date;
}

+ (void)getInterFaceWithIc:(iCarousel *)ic usingViewModel:(id)viewModel atSuperView:(UIView *)superView withRow:(NSInteger)row {
    UIImageView *cover = [[UIImageView alloc]init];
    cover.backgroundColor = [UIColor whiteColor];
    cover.frame = superView.frame;
    [superView addSubview:cover];
    
//    [MBProgressHUD showHUDAddedTo:cover animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
#warning 加载的进度条需要处理
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewModel refreshDataWithRow:row CompletionHandle:^(NSError *error) {
                [cover removeFromSuperview];
                [ic reloadData];
                [SVProgressHUD dismiss];
//                [MBProgressHUD hideHUDForView:cover animated:YES];
            }];
        });
    });
}

/**
 *  添加TopLogo
 */
+(UIView *)addTopLogoToNaviBar:(UINavigationBar *)naviBar {
    UIImageView *topLogo = [[UIImageView alloc]init];
    topLogo.contentMode = UIViewContentModeScaleAspectFit;
    topLogo.image = [UIImage imageNamed:@"LOGO"];
    [naviBar addSubview:topLogo];
    [topLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(naviBar);
        make.size.mas_equalTo(CGSizeMake(108, 44));
        make.bottom.mas_equalTo(0);
    }];
    return topLogo;
}
+ (void)addNaviBarToSuperView:(UIView *)view withTarget:(id)target {
    UINavigationBar *naviBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64)];
#warning LOGO need to be adjusted
    naviBar.backgroundColor = kRGBColor(245, 245, 245);
    [self addTopLogoToNaviBar:naviBar];
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(340, 30, 22, 22)];
    [shareButton setImage:[UIImage imageNamed:@"shareBtn"] forState:(UIControlStateNormal)];
    //    shareButton.nightImageN = [UIImage imageNamed:@"shareBtn"];
    [shareButton bk_addEventHandler:^(id sender) {
        MANYShareView *shareView = [MANYShareView createViewFromNib];
        TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:shareView preferredStyle:(TYAlertControllerStyleActionSheet)];
        alertController.backgoundTapDismissEnable = YES;
        [target presentViewController:alertController animated:YES completion:nil];
    } forControlEvents:(UIControlEventTouchUpInside)];
    [naviBar addSubview:shareButton];
    [view addSubview:naviBar];
}
+ (void)addNonButtonNaviBarToSuperView:(UIView *)view {
    UINavigationBar *naviBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64)];
    naviBar.backgroundColor = kRGBColor(245, 245, 245);
    [self addTopLogoToNaviBar:naviBar];
    [view addSubview:naviBar];
}


+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navBackBtn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navBackBtn"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

@end
