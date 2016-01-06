//
//  CustomContrl.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContrl : UIControl
{
    UIImageView *_titleImageView;
    UILabel *_titleLabel;
}
//设置标题文本
- (void)setTitle:(NSString *)title;
//设置标题图片
- (void)setTitleImage:(UIImage *)titleImage;
@end
