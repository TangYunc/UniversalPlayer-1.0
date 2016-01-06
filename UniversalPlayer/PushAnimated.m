//
//  PushAnimated.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "PushAnimated.h"

@implementation PushAnimated

//设置动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 0.35;
}

//设置动画效果对象
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    //获取动画之前的视图控制器
    UIViewController *formVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //获取动画之后的视图控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //把将要显示的视图控制器添加到导航控制器动画的父视图上
    [[transitionContext containerView] addSubview:toVC.view];
    //把将要显示控制器的根视图放在屏幕的最右边
    toVC.view.left = kScreenWidth;
    //实现两个控制器的根视图的走动动画
    [UIView animateWithDuration:.35 animations:^{
        formVC.view.right = 0;
        toVC.view.left = 0;
    } completion:^(BOOL finished) {
        //当动画结束我们需要告诉视图切换对象已经完成了动画设置
        [transitionContext completeTransition:YES];
    }];
}
@end
