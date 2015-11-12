//
//  MANYSurperiseView.m
//  MANY
//
//  Created by 金顺度 on 15/11/12.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYSurperiseView.h"
@interface MANYSurperiseView ()
@property (nonatomic,strong) NSMutableArray *paths;

@end
@implementation MANYSurperiseView
-(NSMutableArray *)paths{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];//将唯一的一个触点对象从set中取出
    CGPoint location = [touch locationInView:self];//获取这个点的坐标
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5;
    [self.paths addObject:path];
    [path moveToPoint:location];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    //将刚刚创建的路径添加一个直线到当前点，最后创建的路径位于数组中的最后一个位置
    UIBezierPath *currentpath = [self.paths lastObject];
    [currentpath addLineToPoint:location];
    //重绘
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    [self.col setStroke];
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
}

@end
