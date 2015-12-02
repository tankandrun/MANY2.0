//
//  MANYShareView.m
//  MANY
//
//  Created by 金顺度 on 15/11/3.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYShareView.h"
#import "UMSocial.h"

@interface MANYShareView()
@property (weak, nonatomic) IBOutlet UILabel *nightLB;
@property (weak, nonatomic) IBOutlet UIButton *colBtn;

@end

@implementation MANYShareView
- (IBAction)dismiss:(id)sender {
    [_delegate dismiss];
}
- (IBAction)addCollection:(id)sender {
    self.colBtn.selected = !self.colBtn.isSelected;
    if (self.colBtn.selected) {
        NSLog(@"加入收藏");
    }
}

- (IBAction)fontChange:(id)sender {
    NSLog(@"改字体");
//    [UMSocialSnsService presentSnsIconSheetView:[self viewController]
//                                         appKey:@"563724cbe0f55a25b0000aa9"
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[UIImage imageNamed:@"icon.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,nil]
//                                       delegate:nil];
}
- (IBAction)nightMod:(id)sender {
    self.nightLB.text = @"日间模式";
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else {
        [DKNightVersionManager nightFalling];
    }
}
#pragma mark - 分享按钮
- (IBAction)shareToWibo:(id)sender {
    [_delegate gotoNextView];
}
- (IBAction)shareToWXFri:(id)sender {
    [_delegate gotoNextView];
}
- (IBAction)shareToTimeLine:(id)sender {
    [_delegate gotoNextView];
}
- (IBAction)shareToQQFri:(id)sender {
    [_delegate gotoNextView];
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
