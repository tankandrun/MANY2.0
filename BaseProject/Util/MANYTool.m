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
    
    [MBProgressHUD showHUDAddedTo:cover animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
#warning 加载的进度条需要处理
//    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewModel refreshDataWithRow:row CompletionHandle:^(NSError *error) {
                [cover removeFromSuperview];
                [ic reloadData];
//                [SVProgressHUD dismiss];
                [MBProgressHUD hideHUDForView:cover animated:YES];
            }];
        });
    });
}
/**
 *  添加TopLogo
 */
+(UIView *)addTopLogo {
    UIImageView *topLogo = [[UIImageView alloc]init];
    topLogo.contentMode = UIViewContentModeScaleAspectFit;
    topLogo.image = [UIImage imageNamed:@"navLogo"];
    topLogo.frame = CGRectMake(137.5, 35, 100, 18);
    return topLogo;
}
+ (void)addNaviBarToSuperView:(UIView *)view withTarget:(id)target {
    UINavigationBar *naviBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64)];
    [naviBar addSubview:[self addTopLogo]];
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
    [naviBar addSubview:[self addTopLogo]];
    [view addSubview:naviBar];
}
@end
