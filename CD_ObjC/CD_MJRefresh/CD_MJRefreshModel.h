//
//  CD_MJRefreshManage.h
//  CD_Kit
//
//  Created by LCD on 2018/3/5.
//  Copyright © 2018年 LCD. All rights reserved.
//

#import "CD_Single.h"

@interface CD_MJRefreshModel : NSObject
/// 下拉闲置状态 文字
@property (nonatomic, strong) NSString *titleIdleDown;
/// 上拉闲置状态 文字
@property (nonatomic, strong) NSString *titleIdleUp;
/// 下拉提示松开状态 文字
@property (nonatomic, strong) NSString *titlePullingDown;
/// 上拉提示松开状态 文字
@property (nonatomic, strong) NSString *titlePullingUp;
/// 下拉松开正在刷新状态
@property (nonatomic, strong) NSString *titleRefreshingDown;
/// 上拉松开正在刷新状态
@property (nonatomic, strong) NSString *titleRefreshingUp;
/// 下拉数据加载完毕状态
@property (nonatomic, strong) NSString *titleNoMoreDataDown;
/// 上拉数据加载完毕状态
@property (nonatomic, strong) NSString *titleNoMoreDataUp;
/// 显示刷新状态的Label字体
@property (nonatomic, strong) UIFont *labelFont;
/// 显示刷新状态的Label颜色
@property (nonatomic, strong) UIColor *labelColor;
/// 下拉刷新状态的Label是否隐藏
@property (nonatomic, assign) BOOL labelHiddenDown;
/// 上拉刷新状态的Label是否隐藏
@property (nonatomic, assign) BOOL labelHiddenUp;
/// 显示时间Label字体
@property (nonatomic, strong) UIFont *timeLabelFont;
/// 显示时间Label颜色
@property (nonatomic, strong) UIColor *timeLabelColor;
/// 时间Label是否隐藏
@property (nonatomic, assign) BOOL timeLabelHidden;
/// 文字和图片间的距离
@property (nonatomic, assign) CGFloat labelLeftInset;
/// 是否禁止自动加载
@property (nonatomic, assign) BOOL automaticallyRefresh;
/// 下拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesIdleDown;
/// 上拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesIdleUp;
/// 下拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesPullingDown;
/// 上拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesPullingUp;
/// 下拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesRefreshingDown;
/// 上拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesRefreshingUp;
/// 下拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesNoMoreDataDown;
/// 上拉闲置状态动画图片 如果不自定义图片则置空
@property (nonatomic, strong) NSArray<UIImage*> *imagesNoMoreDataUp;
@end

/*
@interface CD_MJRefreshManage : CD_Single
@property (strong, nonatomic) CD_MJRefreshModel * model;
@end
*/
