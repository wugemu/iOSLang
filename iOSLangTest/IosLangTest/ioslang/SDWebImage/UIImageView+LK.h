//
//  UIImageView+SY.h
//  Seeyou
//
//  Created by ljh on 14-2-13.
//  Copyright (c) 2014年 linggan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
typedef NS_ENUM(NSInteger, LKImageViewStatus){
    LKImageViewStatusNone = 0,
    LKImageViewStatusLoaded = 1,
    LKImageViewStatusLoading = 2,
    LKImageViewStatusFail = 3
};
typedef void  (^LoadComletedBlock)(UIImage *image);

//图片加载出错了 可以点击重试
@interface UIImageView (LK)

//加载的图片 url地址 可以是 NSString 或 NSURL
@property(copy, nonatomic) id imageURL;

//这个不会设置 image  只会保存ImageURL
- (void)setImageURLFromCache:(id)imageURL;

//当前状态
@property LKImageViewStatus status;

//图片点击事件  不用再手动添加UITapGestureRecognizer
@property(copy, nonatomic) void(^onTouchTapBlock)(UIImageView *imageView);

//重新加载图片
- (void)reloadImageURL;
//加载图片 设置默认图片 added by hs
- (void) setImage:(NSString *)imageStr defaultImageName:(NSString *)defaultImageName;

//加载图片 设置默认图片
- (void) setPicImageStr:(NSString *)imageStr defaultImageStr:(NSString *)defaultImageStr;

- (void)setPicImageStr:(NSString *)imageStr size:(CGSize)size;


// 加了个block属性 added byh hs
@property(copy, nonatomic) LoadComletedBlock onLoadCompletedBlock;

@end
