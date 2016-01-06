//
//  BaseNavigationViewController.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = NO;
    //设置导航栏图片
    UIImage *navBarImage = [UIImage imageNamed:@"nav_bg_all.png"];
    //使用CoreGraphics框架去改变图片原始大小
    CGImageRef endImageRef = CGImageCreateWithImageInRect(navBarImage.CGImage, CGRectMake(130, 0, kScreenWidth, 64));
    navBarImage = [UIImage imageWithCGImage:endImageRef];
    [self.navigationBar setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    //释放图片
    CGImageRelease(endImageRef);
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
