//
//  UIScrollView+CD_MJRefresh.h
//  CD_Kit
//
//  Created by LCD on 2018/3/5.
//  Copyright © 2018年 LCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "CD_MJRefreshModel.h"

typedef NS_ENUM(NSUInteger, CD_MJRefreshType) {
    /// 开始拉刷新
    CD_MJRefreshTypeBegin,
    /// 结束刷新
    CD_MJRefreshTypeEnd,
    /// 结束刷新 并不再加载
    CD_MJRefreshTypeNoMoreData,
    /// 回复上拉
    CD_MJRefreshTypeReset,
    /// 隐藏底部
    CD_MJRefreshTypeHiddenFoot,
    /// 显示底部
    CD_MJRefreshTypeShowFoot
};

@interface UIScrollView (CD_MJRefresh)

@property (nonatomic, strong) CD_MJRefreshModel * cd_mjRefreshModel;

/// 添加头部下拉刷新
- (void)cd_headerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block;
/// 添加头部下拉刷新 Gif版
- (void)cd_headerAddMJRefreshGif:(MJRefreshComponentRefreshingBlock)block;
/// 添加头部下拉刷新 自定义Model样式
- (void)cd_headerAddMJRefresh:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;
/// 添加头部下拉刷新 Gif 自定义Model样式
- (void)cd_headerAddMJRefreshGif:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;



/// 添加底部部上拉加载 默认自动版
- (void)cd_footerAddMJRefreshAuto:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 Gif自动版
- (void)cd_footerAddMJRefreshGifAuto:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 默认手动版
- (void)cd_footerAddMJRefreshBack:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 Gif自动版
- (void)cd_footerAddMJRefreshGifBack:(MJRefreshComponentRefreshingBlock)block;

/// 添加底部部上拉加载 默认自动版 自定义 Model样式
- (void)cd_footerAddMJRefreshAuto:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 Gif自动版 自定义 Model样式
- (void)cd_footerAddMJRefreshGifAuto:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 默认手动版 自定义 Model样式
- (void)cd_footerAddMJRefreshBack:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;
/// 添加底部部上拉加载 Gif自动版 自定义 Model样式
- (void)cd_footerAddMJRefreshGifBack:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block;

/// 开始刷新
- (void)cd_beginRefreshing;
/// 结束刷新
- (void)cd_endRefreshing;
/// 结束加载并不再加载
- (void)cd_endRefreshingWithNoMoreData;
/// 恢复加载
- (void)cd_footResetNoMoreData;
/// 底部上拉 是否隐藏
- (void)cd_footHidden:(BOOL)hidden;
/// 刷新状态 变更组合 --> CD_MJRefreshType
- (void)cd_mjRefreshTypes:(NSArray<NSNumber*>*)types;
@end

