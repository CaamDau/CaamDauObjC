//
//  CD_MJRefreshModel.m
//  CD_Kit
//
//  Created by LCD on 2018/3/5.
//  Copyright © 2018年 LCD. All rights reserved.
//

#import "CD_MJRefreshModel.h"

@implementation CD_MJRefreshModel
- (instancetype)init
{
    self = [super init];
    if(self){
        [self makeDefault];
    }
    return self;
}

/// 下拉
- (NSString *)down_txtIdle{
    return _down_txtIdle ? _down_txtIdle : @"";
}
/// 下拉
- (NSString *)down_txtPulling{
    return _down_txtPulling ? _down_txtPulling : @"";
}
/// 下拉
- (NSString *)down_txtWillRefresh{
    return _down_txtWillRefresh ? _down_txtWillRefresh : @"";
}

/// 下拉
- (NSString *)down_txtRefreshing{
    return _down_txtRefreshing ? _down_txtRefreshing : @"";
}

/// 下拉
- (NSString *)down_txtNoMoreData{
    return _down_txtNoMoreData ? _down_txtNoMoreData : @"";
}

/// 下拉刷新状态的Label字体
- (UIFont *)down_txtFont{
    return _down_txtFont ? _down_txtFont : [UIFont systemFontOfSize:14];
}
/// 下拉刷新状态的Label文字颜色
- (UIColor *)down_txtColor{
    return _down_txtColor ? _down_txtColor : [UIColor lightGrayColor];
}

/// 下拉刷新状态的time字体
- (UIFont *)down_timeFont{
    return _down_timeFont ? _down_timeFont : [UIFont systemFontOfSize:12];
}
/// 下拉刷新状态的time文字颜色
- (UIColor *)down_timeColor{
    return _down_timeColor ? _down_timeColor : [UIColor lightGrayColor];
}


/// 下拉
- (NSArray<UIImage*> *)down_imgIdle{
    return _down_imgIdle ? _down_imgIdle : @[];
}
/// 下拉
- (NSArray<UIImage*> *)down_imgPulling{
    return _down_imgPulling ? _down_imgPulling : @[];
}
/// 下拉
- (NSArray<UIImage*> *)down_imgWillRefresh{
    return _down_imgWillRefresh ? _down_imgWillRefresh : @[];
}
/// 下拉
- (NSArray<UIImage*> *)down_imgRefreshing{
    return _down_imgRefreshing ? _down_imgRefreshing : @[];
}
/// 下拉
- (NSArray<UIImage*> *)down_imgNoMoreData{
    return _down_imgNoMoreData ? _down_imgNoMoreData : @[];
}



/// 下拉
- (NSString *)up_txtIdle{
    return _up_txtIdle ? _up_txtIdle : @"";
}
/// 下拉
- (NSString *)up_txtPulling{
    return _up_txtPulling ? _up_txtPulling : @"";
}
/// 下拉
- (NSString *)up_txtWillRefresh{
    return _up_txtWillRefresh ? _up_txtWillRefresh : @"";
}

/// 下拉
- (NSString *)up_txtRefreshing{
    return _up_txtRefreshing ? _up_txtRefreshing : @"";
}

/// 下拉
- (NSString *)up_txtNoMoreData{
    return _up_txtNoMoreData ? _up_txtNoMoreData : @"";
}

/// 下拉刷新状态的Label字体
- (UIFont *)up_txtFont{
    return _up_txtFont ? _up_txtFont : [UIFont systemFontOfSize:14];
}
/// 下拉刷新状态的Label文字颜色
- (UIColor *)up_txtColor{
    return _up_txtColor ? _up_txtColor : [UIColor lightGrayColor];
}



/// 下拉
- (NSArray<UIImage*> *)up_imgIdle{
    return _up_imgIdle ? _up_imgIdle : @[];
}
/// 下拉
- (NSArray<UIImage*> *)up_imgPulling{
    return _up_imgPulling ? _up_imgPulling : @[];
}
/// 下拉
- (NSArray<UIImage*> *)up_imgWillRefresh{
    return _up_imgWillRefresh ? _up_imgWillRefresh : @[];
}
/// 下拉
- (NSArray<UIImage*> *)up_imgRefreshing{
    return _up_imgRefreshing ? _up_imgRefreshing : @[];
}
/// 下拉
- (NSArray<UIImage*> *)up_imgNoMoreData{
    return _up_imgNoMoreData ? _up_imgNoMoreData : @[];
}



- (void)makeDefault{
    self.down_txtHidden = YES;
    self.down_timeHidden = YES;
    self.down_leftInset = 0;
    self.down_activityStyle = UIActivityIndicatorViewStyleGray;
    
    self.up_txtHidden = YES;
    self.up_leftInset = 0;
    self.up_activityStyle = UIActivityIndicatorViewStyleGray;
    
    self.isAutoRefresh = YES;
    self.ignoredContentInsetBottom = 0;
    self.ignoredContentInsetTop = 0;
    self.autoRefreshPercent = 1;
    self.onlyRefreshPerDrag = NO;
}
@end



/*
@implementation CD_MJRefreshManage
+ (instancetype) shared
{
    static CD_MJRefreshManage * sharedManage;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManage = [[self alloc] init];
    });
    return sharedManage;
}

- (CD_MJRefreshModel *)model{
    if (!_model) {
        _model = [CD_MJRefreshModel new];
    }
    return _model;
}

@end
*/
