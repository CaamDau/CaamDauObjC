
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CD_RowDidSelectBlock)(void);
typedef void (^CD_RowCallBack)(id any);

@protocol CD_RowDelegate <NSObject>
@optional
- (void)row_updateViewData:(id)viewData tag:(NSNumber*)tag;
- (void)row_updateViewData:(id)viewData;
- (void)row_callBack:(CD_RowCallBack)callBack;
@end


@interface CD_Row : NSObject
@property(nonatomic, copy, readonly) NSString *identifier;
/// 数据源 类型 标号 标签 在共用View 等情况下可设置标识
@property(nonatomic, assign) NSInteger tag;
/// Row  size
@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;

/// view Class 类
@property(nonatomic, strong) Class viewClass;
/// 数据源
@property(nonatomic, strong) id viewData;
/// view 内部事件回调
@property(nonatomic, copy) CD_RowCallBack callBack;
/// view 点击回调
@property(nonatomic, copy) CD_RowDidSelectBlock didSelectBlock;
///
- (instancetype)initWithViewClass:(Class)cls;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData frame:(CGRect)frame;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData size:(CGSize)size;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData height:(CGFloat)height;


- (void)bindView:(UIView *)view;
@end



NS_ASSUME_NONNULL_END
