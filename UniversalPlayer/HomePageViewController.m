//
//  HomePageViewController.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    //初始化子视图
    [self _initSubViews];
    //自定义右侧导航栏按钮
    [self CustomRightNavButtons];
    
    
}
    //初始化子视图
- (void)_initSubViews{

    //电影列表视图
    _movieListTableView = [[MovieListTabelView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    [self.view addSubview:_movieListTableView];
    //海报视图
    _posterView = [[PosterView alloc] initWithFrame:_movieListTableView.bounds];
    _posterView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_posterView];
}
    //自定义右侧导航栏按钮
- (void)CustomRightNavButtons{

    //创建海报按钮
    UIButton *posterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    posterButton.frame = CGRectMake(0, 0, 49, 25);
    //设置背景图片
    [posterButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home.png"] forState:UIControlStateNormal];
    //设置标题图片
    [posterButton setImage:[UIImage imageNamed:@"poster_home.png"] forState:UIControlStateNormal];
    [posterButton addTarget:self action:@selector(posterButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //创建列表按钮
    UIButton *movieListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    movieListButton.frame = CGRectMake(0, 0, 49, 25);
    //设置背景图片
    [movieListButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home.png"] forState:UIControlStateNormal];
    //设置标题图片
    [movieListButton setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    [movieListButton addTarget:self action:@selector(movieListButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //右侧按钮的视图
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 49, 25)];
    //把海报按钮添加到按钮视图上
    [rightView addSubview:posterButton];
    //把电影列表按钮添加到按钮视图上
    [rightView addSubview:movieListButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
}

#pragma mark - posterButtonAction:
- (void)posterButtonAction:(UIButton *)posterButton{

    // 切换当前控制器根视图的海报视图和列表视图的上下位置
    [self animationTransitionWithSuperView:self.view formLeft:NO];
    // 切换右侧导航按钮视图的海报按钮和列表按钮的上下位置
    [self animationTransitionWithSuperView:posterButton.superview formLeft:NO];

}
#pragma mark - movieListButtonAction:
- (void)movieListButtonAction:(UIButton *)movieListButton{

    // 切换当前控制器根视图的海报视图和列表视图的上下位置
    [self animationTransitionWithSuperView:self.view formLeft:YES];
    // 切换右侧导航按钮视图的海报按钮和列表按钮的上下位置
    [self animationTransitionWithSuperView:movieListButton.superview formLeft:YES];
    
}
#pragma mark - 翻转动画的方法封装
- (void)animationTransitionWithSuperView:(UIView *)superView formLeft:(BOOL)formLeft{

[UIView animateWithDuration:.35 animations:^{
    //添加翻转动画配置
    [UIView setAnimationTransition:formLeft ==YES ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:superView cache:YES];
    //切换右侧导航栏按钮视图的海报按钮和电影列表按钮的上下位置
    [superView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}];
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
