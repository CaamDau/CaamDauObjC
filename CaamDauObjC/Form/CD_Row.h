// 附上Swift 版本：https://github.com/liucaide/CD


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CD_RowDidSelect)(void);
typedef void (^CD_RowCallback)(id any);

@protocol CD_RowDelegate <NSObject>
@optional
- (void)row_updateConfig:(id)config;
- (void)row_updateViewData:(id)data;
- (void)row_callback:(CD_RowCallback)block;
@end


@interface CD_Row : NSObject
@property(nonatomic, copy, readonly) NSString *identifier;
/// Row  size
@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;
/**
 用于UICollectionView sectionInset，
 另 LineSpacing InteritemSpacing 使用 frame - x  y
 用于 UIButton imageEdgeInsets
 */
///UIEdgeInsets
@property(nonatomic, assign) UIEdgeInsets insets;
/// UIEdgeInsets 可用于 UIButton titleEdgeInsets
@property(nonatomic, assign) UIEdgeInsets insetsTitle;
/// view Class 类
@property(nonatomic, strong) Class viewClass;
/// - 来源
@property(nonatomic, copy) NSString *bundleFrom;
/// 数据源 - 配置
@property(nonatomic, strong) id config;
/// 数据源 - 数据
@property(nonatomic, strong) id viewData;

/// view 内部事件回调
@property(nonatomic, copy) CD_RowCallback callback;
/// view 点击回调
@property(nonatomic, copy) CD_RowDidSelect didSelect;
///


- (instancetype)initWithViewClass:(Class)cls then:(void (^)(CD_Row *))then;
+ (instancetype)rowWithViewClass:(Class)cls then:(void (^)(CD_Row *))then;

- (void)bindView:(UIView *)view;
@end



NS_ASSUME_NONNULL_END
