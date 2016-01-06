//
//  TabBarViewController.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushAnimated.h"
#import "PopAnimated.h"
@interface TabBarViewController : UITabBarController<UINavigationControllerDelegate>
{
    UIImageView *_tabBarImageView;//自定义标签栏
    UIImageView *_selectedImageView;//选中背景视图
    //Push动画对象
    PushAnimated *_pushAnimated;
    //POP动画效果对象
    PopAnimated *_popAnimated;
    
    
}
@end
