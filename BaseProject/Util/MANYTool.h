//
//  MANYTool.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MANYTool : NSObject
/**
 *  将日期的字符串转换为NSDate类型
 */
+ (NSDate *)dateFromString:(NSString *)dateStr;
/**
 *  获取MMMM dd, yyyy型的日期
 */
+ (NSString *)getBigDateFromString:(NSString *)dateStr;
/**
 *  显示界面
 */
+ (void)getInterFaceWithIc:(iCarousel *)ic usingViewModel:(id)viewModel atSuperView:(UIView *)superView withRow:(NSInteger)row;

/**
 *  添加带有按钮的UINavigationBar
 */
+ (void)addNaviBarToSuperView:(UIView *)view withTarget:(id)target;
/**
 *  添加没有按钮的UINavigationBar
 */
+ (void)addNonButtonNaviBarToSuperView:(UIView *)view;
@end
