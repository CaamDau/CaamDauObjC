
#import <Foundation/Foundation.h>

@interface CD_MJRefreshModel : NSObject
/// 下拉
@property (nonatomic, strong) NSString *down_txtIdle;
/// 下拉
@property (nonatomic, strong) NSString *down_txtPulling;
/// 下拉
@property (nonatomic, strong) NSString *down_txtWillRefresh;
/// 下拉
@property (nonatomic, strong) NSString *down_txtRefreshing;
/// 下拉
@property (nonatomic, strong) NSString *down_txtNoMoreData;

/// 下拉刷新状态的Label字体
@property (nonatomic, strong) UIFont * down_txtFont;
/// 下拉刷新状态的Label文字颜色
@property (nonatomic, strong) UIColor * down_txtColor;
/// 下拉刷新状态的Label是否隐藏
@property (nonatomic, assign) BOOL down_txtHidden;
/// 下拉刷新状态的time字体
@property (nonatomic, strong) UIFont * down_timeFont;
/// 下拉刷新状态的time文字颜色
@property (nonatomic, strong) UIColor * down_timeColor;
/// 下拉刷新状态的time是否隐藏
@property (nonatomic, assign) BOOL down_timeHidden;
/// 下拉文字和图片间的距离
@property (nonatomic, assign) CGFloat down_leftInset;
/// 下拉菊花样式
@property (nonatomic, assign) UIActivityIndicatorViewStyle down_activityStyle;
/// 下拉时间格式自定义
@property (nonatomic, copy) NSString * (^down_timeText)(NSDate*);

/// 下拉
@property (nonatomic, strong) NSArray<UIImage*> *down_imgIdle;
/// 下拉
@property (nonatomic, strong) NSArray<UIImage*> *down_imgPulling;
/// 下拉
@property (nonatomic, strong) NSArray<UIImage*> *down_imgWillRefresh;
/// 下拉
@property (nonatomic, strong) NSArray<UIImage*> *down_imgRefreshing;
/// 下拉
@property (nonatomic, strong) NSArray<UIImage*> *down_imgNoMoreData;



/// 上拉
@property (nonatomic, strong) NSString *up_txtIdle;
/// 上拉
@property (nonatomic, strong) NSString *up_txtPulling;
/// 上拉
@property (nonatomic, strong) NSString *up_txtWillRefresh;
/// 上拉
@property (nonatomic, strong) NSString *up_txtRefreshing;
/// 上拉
@property (nonatomic, strong) NSString *up_txtNoMoreData;

/// 上拉
@property (nonatomic, strong) NSArray<UIImage*> *up_imgIdle;
/// 上拉
@property (nonatomic, strong) NSArray<UIImage*> *up_imgPulling;
/// 上拉
@property (nonatomic, strong) NSArray<UIImage*> *up_imgWillRefresh;
/// 上拉
@property (nonatomic, strong) NSArray<UIImage*> *up_imgRefreshing;
/// 上拉
@property (nonatomic, strong) NSArray<UIImage*> *up_imgNoMoreData;

/// 上拉刷新状态的Label字体
@property (nonatomic, strong) UIFont * up_txtFont;
/// 上拉刷新状态的Label文字颜色
@property (nonatomic, strong) UIColor * up_txtColor;
/// 上拉刷新状态的Label是否隐藏
@property (nonatomic, assign) BOOL up_txtHidden;
/// 上拉文字和图片间的距离
@property (nonatomic, assign) CGFloat up_leftInset;
/// 上拉菊花样式
@property (nonatomic, assign) UIActivityIndicatorViewStyle up_activityStyle;


/// 是否禁止自动加载
@property (nonatomic, assign) BOOL isAutoRefresh;
/// 忽略多少scrollView的contentInset的bottom
@property (nonatomic, assign) CGFloat ignoredContentInsetBottom;
/// 忽略多少scrollView的contentInset的Top
@property (nonatomic, assign) CGFloat ignoredContentInsetTop;
/// 当底部控件出现多少时就自动刷新
@property (nonatomic, assign) CGFloat autoRefreshPercent;
/// 是否每一次拖拽只发一次请求
@property (nonatomic, assign) BOOL onlyRefreshPerDrag;


@end

/*
#pragma mark ----- 全局单例
@interface CD_MJRefreshManage : NSObject

-(nonnull instancetype)init NS_UNAVAILABLE;
+ (nonnull instancetype)new NS_UNAVAILABLE;
+ (instancetype)shared;

@property (strong, nonatomic) CD_MJRefreshModel * model;

@end
*/
