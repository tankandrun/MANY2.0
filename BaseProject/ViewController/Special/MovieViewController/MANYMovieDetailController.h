//
//  MANYMovieDetailController.h
//  MANY
//
//  Created by 金顺度 on 15/11/18.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MANYMovieDetailModel.h"

@interface MANYMovieDetailController : UIViewController

@property (nonatomic,strong) MovieDetailModel *detail;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSURL *mainImage;
@property (nonatomic,strong) NSString *rating;
@property (nonatomic,strong) NSString *intro;

@end
