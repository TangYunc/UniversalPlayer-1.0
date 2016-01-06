//
//  MovieModel.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//
/*
 "subjects" : [
 {
 "box" : 27361000,
 "new" : true,
 "subject" : {
 "rating" : {
 "stars" : "40",
 "average" : 7.3,
 "min" : 0,
 "max" : 10
 },
 "collect_count" : 49,
 "images" : {
 "small" : "http:\/\/img3.douban.com\/view\/photo\/icon\/public\/p1943399384.jpg",
 "large" : "http:\/\/img3.douban.com\/view\/photo\/photo\/public\/p1943399384.jpg",
 "medium" : "http:\/\/img3.douban.com\/view\/photo\/thumb\/public\/p1943399384.jpg"
 },
 "id" : "3170961",
 "alt" : "http:\/\/movie.douban.com\/subject\/3170961\/",
 "title" : "双枪",
 "subtype" : "movie",
 "year" : "2013",
 "original_title" : "2 Guns"
 },
 "rank" : 1
 },

 */
#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property (nonatomic, strong) NSString *title; // 标题
@property (nonatomic, strong) NSString *year; // 年份
@property (nonatomic, strong) NSString *original_title; // 英文标题
@property (nonatomic, strong) NSNumber *average; // 平均分
@property (nonatomic, strong) NSString *images_small; // 小电影海报图片
@property (nonatomic, strong) NSString *images_medium; // 中电影海报图片
@property (nonatomic, strong) NSString *images_large; // 大电影海报图片

@end
