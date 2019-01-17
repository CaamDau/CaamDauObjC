//
//  CD_MJRefreshModel.m
//  CD_Kit
//
//  Created by LCD on 2018/3/5.
//  Copyright © 2018年 LCD. All rights reserved.
//

#import "CD_MJRefreshModel.h"

@implementation CD_MJRefreshModel
//自定义初始化方法
- (instancetype)init
{
    self = [super init];
    if(self){
        [self makeDefault];
    }
    return self;
}
/** 下拉闲置状态 文字*/
- (NSString *)titleIdleDown{
    return _titleIdleDown ? _titleIdleDown : @"";
}
/** 上拉闲置状态 文字*/
- (NSString *)titleIdleUp{
    return _titleIdleUp ? _titleIdleUp : @"";
}
/** 下拉提示松开状态 文字*/
- (NSString *)titlePullingDown{
    return _titlePullingDown ? _titlePullingDown : @"";
}
/** 上拉提示松开状态 文字*/
- (NSString *)titlePullingUp{
    return _titlePullingUp ? _titlePullingUp : @"";
}
/** 下拉松开正在刷新状态*/
- (NSString *)titleRefreshingDown{
    return _titleRefreshingDown ? _titleRefreshingDown : @"";
}
/** 上拉松开正在刷新状态*/
- (NSString *)titleRefreshingUp{
    return _titleRefreshingUp ? _titleRefreshingUp : @"";
}
/** 下拉数据加载完毕状态*/
- (NSString *)titleNoMoreDataDown{
    return _titleNoMoreDataDown ? _titleNoMoreDataDown : @"";
}
/** 上拉数据加载完毕状态*/
- (NSString *)titleNoMoreDataUp{
    return _titleNoMoreDataUp ? _titleNoMoreDataUp : @"没有更多数据";
}

/** 显示刷新状态的Label字体*/
- (UIFont *)labelFont{
    return _labelFont ? _labelFont : font_14();
}
/** 显示刷新状态的Label颜色*/
- (UIColor *)labelColor{
    return _labelColor ? _labelColor : color_Txt_3();
}
/** 显示时间Label字体*/
- (UIFont *)timeLabelFont{
    return _timeLabelFont ? _timeLabelFont : font_14();
}
/** 显示时间Label颜色*/
- (UIColor *)timeLabelColor{
    return _timeLabelColor ? _timeLabelColor : color_Txt_3();
}
/** 文字和图片间的距离*/
- (CGFloat)labelLeftInset{
    return _labelLeftInset ? _labelLeftInset : 0.0;
}
/** 下拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesIdleDown{
    return _imagesIdleDown ? _imagesIdleDown : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 上拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesIdleUp{
    return _imagesIdleUp ? _imagesIdleUp : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 下拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesPullingDown{
    return _imagesPullingDown ? _imagesPullingDown : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 上拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesPullingUp{
    return _imagesPullingUp ? _imagesPullingUp : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 下拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesRefreshingDown{
    return _imagesRefreshingDown ? _imagesRefreshingDown : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 上拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesRefreshingUp{
    return _imagesRefreshingUp ? _imagesRefreshingUp : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 下拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesNoMoreDataDown{
    return _imagesNoMoreDataDown ? _imagesNoMoreDataDown : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
/** 上拉闲置状态动画图片 如果不自定义图片则置空*/
- (NSArray<UIImage*> *)imagesNoMoreDataUp{
    return _imagesNoMoreDataUp ? _imagesNoMoreDataUp : @[[UIImage imageNamed:@"cd_PlaceholderImageName"]];
}
- (void)makeDefault{
    /** 下拉刷新状态的Label是否隐藏*/
    self.labelHiddenDown = YES;
    /** 上拉刷新状态的Label是否隐藏*/
    self.labelHiddenUp = NO;
    /** 时间Label是否隐藏*/
    self.timeLabelHidden = YES;
    /** 是否禁止自动加载*/
    self.automaticallyRefresh = YES;
}
@end

/*
@implementation CD_MJRefreshManage


- (CD_MJRefreshModel *)model{
    if (!_model) {
        _model = [CD_MJRefreshModel new];
    }
    return _model;
}

@end
*/
