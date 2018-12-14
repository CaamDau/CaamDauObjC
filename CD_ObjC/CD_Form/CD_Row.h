
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CD_RowDelegate <NSObject>
@optional
- (void)row_updateViewData:(id)viewData tag:(NSNumber*)tag;
- (void)row_updateViewData:(id)viewData;
@end


@interface CD_Row : NSObject
@property(nonatomic, copy, readonly) NSString *identifier;
/// 数据源 类型 标号 标签 在共用View 等情况下可设置标识
@property(nonatomic, assign) NSInteger tag;
/// Row  size
@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;

/// Cell 类
@property(nonatomic, strong) Class cellClass;
/// 数据源
@property(nonatomic, strong) id viewData;
///
- (instancetype)initWithViewClass:(Class)cls;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData frame:(CGRect)frame;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData size:(CGSize)size;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData height:(CGFloat)height;

    
- (void)updateView:(UIView *)view;
@end



NS_ASSUME_NONNULL_END
