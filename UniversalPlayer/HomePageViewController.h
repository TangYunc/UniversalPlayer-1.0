//
//  HomePageViewController.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "BaseViewController.h"
#import "PosterView.h"
#import "MovieListTabelView.h"

@interface HomePageViewController : BaseViewController
{
    //海报视图
    PosterView *_posterView;
    //电影列表视图
    MovieListTabelView *_movieListTableView;
}
@end
