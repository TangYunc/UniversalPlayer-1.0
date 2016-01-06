//
//  CustomContrl.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "CustomContrl.h"

@implementation CustomContrl
// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-19)/2, 7, 19, 20)];
        _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_titleImageView];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _titleImageView.bottom+3, self.width, 12)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:12];
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
    }
    return self;
}



// 设置标题文本
- (void)setTitle:(NSString *)title{
    
        _titleLabel.text = title;

}
// 设置标题图片
- (void)setTitleImage:(UIImage *)titleImage{

    _titleImageView.image = titleImage;

}


@end
