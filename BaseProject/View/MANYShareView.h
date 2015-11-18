//
//  MANYShareView.h
//  MANY
//
//  Created by 金顺度 on 15/11/3.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareViewDelegate <NSObject>

@optional
- (void)gotoNextView;
- (void)dismiss;

@end




@interface MANYShareView : UIView

@property (nonatomic,weak) id<ShareViewDelegate>delegate;

//分享按钮
@property (weak, nonatomic) IBOutlet UIButton *shareToWeibo;
@property (weak, nonatomic) IBOutlet UIButton *shareToWXFri;
@property (weak, nonatomic) IBOutlet UIButton *shareToTimeLine;
@property (weak, nonatomic) IBOutlet UIButton *shareToQQFri;


@end
