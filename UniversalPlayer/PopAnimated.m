//
//  PopAnimated.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "PopAnimated.h"

@implementation PopAnimated
//设置动画时间
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return .35;
}

// 设置动画效果对象
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 01 获取动画之前的视图控制器
    UIViewController *formVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 02 获取动画之后的视图控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 把将要现实的视图控制器添加到导航控制器动画的父视图上
    [[transitionContext containerView] addSubview:toVC.view];
    // 把将要显示控制器的根视图放在屏幕的最右边
    toVC.view.right = 0;
    // 03 实现两个控制器的根视图的走动动画
    [UIView animateWithDuration:.35 animations:^{
        formVC.view.left = kScreenWidth;
        toVC.view.left = 0;
    } completion:^(BOOL finished) {
        // 当动画结束我们需要告诉视图切换对象已经完成了动画设置
        [transitionContext completeTransition:YES];
    }];
    
}
@end
