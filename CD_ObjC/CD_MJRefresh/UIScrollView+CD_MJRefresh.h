//Created  on 2018/3/5  by LCD :https://github.com/liucaide .

/*** 模块文档 ***
 使用 示例
- (void)cd_addMJRefresh{
    // ---> 可单独在某一页面配置 cd_mjRefreshModel 达到与其他页面不同效果
    CD_MJRefreshModel *model = [CD_MJRefreshModel new];
    model.labelHiddenDown = NO;
    model.titleRefreshingDown = @"正在刷新";
    self.tableView.cd_mjRefreshModel = model;
    // <---
 
    [self.tableView cd_headerAddMJRefresh:^{
        @strongify(self)
        [self.vm requestDataRefresh:YES];
    }];
    [self.tableView cd_footerAddMJRefreshAuto:^{
        @strongify(self)
        [self.vm requestDataRefresh:NO];
    }];
    [self.tableView cd_mjRefreshTypes:self.vm.refreshTypes];
}

// ---> 当然也可以配置全局 cd_mjRefreshModel 统一刷新效果
        创建一个分类 重写 cd_mjRefreshModel 的Get 方法
@interface UIScrollView (CD_MJRefreshModelCustom)
@end
@implementation UIScrollView (CD_MJRefreshModelCustom)

- (CD_MJRefreshModel *)cd_mjRefreshModel{
    CD_MJRefreshModel * model = objc_getAssociatedObject(self, _cmd);
    if (model) {
        return model;
    }else{
        model = [CD_MJRefreshModel new];
        model.labelHiddenDown = NO;
        model.titleRefreshingDown = @"1234567";
        [self setCd_mjRefreshModel:model];
    }
    return model;
}
@end
*/
 

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

@property (nonatomic, strong) CD_MJRefreshModel * cd_mjRefreshModel UI_APPEARANCE_SELECTOR;

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

