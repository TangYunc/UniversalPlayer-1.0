//
//  TabBarViewController.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomePageViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinamerViewController.h"
#import "MoreViewController.h"
#import "CustomContrl.h"

#import "BaseNavigationViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化子视图
    [self _initSubViews];
    //自定义标签栏
    [self CustomTabBar];
    //创建导航控制器的动画对象
    _pushAnimated = [[PushAnimated alloc] init];
    _popAnimated = [[PopAnimated alloc] init];
}

- (void)_initSubViews{

    // 创建各个视图控制器
    HomePageViewController *homePageVC = [[HomePageViewController alloc] init];
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    TopViewController *topVC = [[TopViewController alloc] init];
    CinamerViewController *cinamerVC = [[CinamerViewController alloc] init];
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    
    //将所有的控制器放入一个数组中
    NSArray *viewCtrls = @[homePageVC,newsVC,topVC,cinamerVC,moreVC];
    
    NSMutableArray *navCtrls = [[NSMutableArray alloc] init];
    //为所有的视图控制器创建导航控制器
    for (BaseViewController *viewCtrl in viewCtrls) {
        BaseNavigationViewController *baseNavVC = [[BaseNavigationViewController alloc] initWithRootViewController:viewCtrl];
        baseNavVC.delegate = self;
        [navCtrls addObject:baseNavVC];
    }
    self.viewControllers = navCtrls;

}
//自定义标签栏
- (void)CustomTabBar{

    //隐藏系统的标签栏
    self.tabBar.hidden = YES;
    //创建标签栏
    _tabBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    //开启视图的点击事件
    _tabBarImageView.userInteractionEnabled = YES;
    _tabBarImageView.image = [UIImage imageNamed:@"tab_bg_all.png"];
    [self.view addSubview:_tabBarImageView];
    //选中视图
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth/5-42)/2, (49-42)/2, 42, 42)];
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1.png"];
    [_tabBarImageView addSubview:_selectedImageView];

    // 设置标签栏元素
    NSArray *titleArr = @[@"首页",@"新闻",@"Top",@"影院",@"更多"];
    NSArray *imageArr = @[@"movie_home.png",
                          @"msg_new.png",
                          @"start_top250.png",
                          @"icon_cinema.png",
                          @"more_select_setting.png"];
    float barItemWidth = kScreenWidth/titleArr.count;
    for (int i=0; i<titleArr.count; i++) {
        CustomContrl *barItem = [[CustomContrl alloc] initWithFrame:CGRectMake(i*barItemWidth, 0, barItemWidth, 49)];
        barItem.tag = i;
        [barItem setTitle:titleArr[i]];
        [barItem setTitleImage:[UIImage imageNamed:imageArr[i]]];
        [barItem addTarget:self action:@selector(barItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarImageView addSubview:barItem];
    }
}
#pragma mark - 标签栏按钮事件
- (void)barItemAction:(CustomContrl *)barItem{

    self.selectedIndex = barItem.tag;
    //设置选中背景图片互动的位置
    [UIView animateWithDuration:0.35 animations:^{
        _selectedImageView.center = barItem.center;
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //获取当前控制器子视图控制器的个数
    int count = (int)navigationController.viewControllers.count;
    if (count == 2) {
        //说明当前导航控制器要实现在第二个子视图控制器的位置
        //隐藏标签栏
        [UIView animateWithDuration:0.35 animations:^{
            _tabBarImageView.right =0;
        }];
    }else if (count ==1){
    //说明当前导航控制器要实现在根视图控制器的位置
        [UIView animateWithDuration:.35 animations:^{
            _tabBarImageView.left = 0;
        }];
    }
}

// 在6.0之前这个隐藏标签栏的动画完全可以匹配上
// 在7.0之后需要重写导航控制的动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPush) {
        return _pushAnimated;
    }else if (operation ==UINavigationControllerOperationPop){
        return _popAnimated;
    }else{
        return nil;
    }
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
