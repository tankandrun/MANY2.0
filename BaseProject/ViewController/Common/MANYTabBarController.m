//
//  MANYTabBarController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYTabBarController.h"
@interface MANYTabBarController ()

@end

@implementation MANYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UITabBar appearance]setTintColor:myTintRGB];
    [[UITabBar appearance]setNightBarTintColor:kRGBColor(48, 48, 48)];
    UITabBarItem *itemOne = [self.tabBar.items objectAtIndex:0];
    itemOne.image = [UIImage imageNamed:@"home"];
    itemOne.selectedImage = [UIImage imageNamed:@"homeSelected"];
    itemOne.title = @"首页";
    UITabBarItem *itemTwo = [self.tabBar.items objectAtIndex:1];
    itemTwo.image = [UIImage imageNamed:@"reading"];
    itemTwo.selectedImage = [UIImage imageNamed:@"readingSelected"];
    itemTwo.title = @"文章";
    UITabBarItem *itemThird = [self.tabBar.items objectAtIndex:2];
    itemThird.image = [UIImage imageNamed:@"question"];
    itemThird.selectedImage = [UIImage imageNamed:@"questionSelected"];
    itemThird.title = @"问题";
    UITabBarItem *itemFour = [self.tabBar.items objectAtIndex:3];
    itemFour.image = [UIImage imageNamed:@"thing"];
    itemFour.selectedImage = [UIImage imageNamed:@"thingSelected"];
    itemFour.title = @"东西";
    UITabBarItem *itemFive = [self.tabBar.items objectAtIndex:4];
    itemFive.image = [UIImage imageNamed:@"person"];
    itemFive.selectedImage = [UIImage imageNamed:@"personSelected"];
    itemFive.title = @"个人";
    
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
