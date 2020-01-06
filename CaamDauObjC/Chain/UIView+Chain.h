

#import <UIKit/UIKit.h>

@interface UIView (Chain)
+ (instancetype)cd_init;

- (UIView *(NS_NOESCAPE ^)(CGRect))cd_frame;
- (UIView *(NS_NOESCAPE ^)(CGRect ))cd_bounds;
- (UIView *(NS_NOESCAPE ^)(CGPoint ))cd_center;
- (UIView *(NS_NOESCAPE ^)(NSInteger))cd_tag;
- (UIView *(NS_NOESCAPE ^)(BOOL))cd_hidden;
- (UIView *(NS_NOESCAPE ^)(BOOL))cd_userInteractionEnabled;
- (UIView *(NS_NOESCAPE ^)(UIViewContentMode))cd_contentMode;
/// 背景颜色
- (UIView *(NS_NOESCAPE ^)(UIColor*))cd_bgColor;

- (UIView *(NS_NOESCAPE ^)(UIColor*))cd_tintColor;
- (UIView *(NS_NOESCAPE ^)(CGFloat))cd_borderWidth;
- (UIView *(NS_NOESCAPE ^)(UIColor*))cd_borderColor;
- (UIView *(NS_NOESCAPE ^)(CGFloat))cd_cornerRadius;
- (UIView *(NS_NOESCAPE ^)(BOOL))cd_clipsToBounds;
- (UIView *(NS_NOESCAPE ^)(CGFloat, BOOL))cd_radius_clips;
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 圆角类型组 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
/// 设置部分圆角(绝对布局)
- (UIView *(NS_NOESCAPE ^)(UIRectCorner, CGSize))cd_byRoundedCornersRadii;
/**
 *  设置部分圆角(相对布局)
 *  @param rect    圆角view的rect
 *  @param corners 圆角类型组 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *
 */
/// 设置部分圆角(相对布局)
- (UIView *(NS_NOESCAPE ^)(UIRectCorner, CGSize, CGRect))cd_byRoundedRectCornersRadii;

/// 变形属性(平移\缩放\旋转)
- (UIView *(NS_NOESCAPE ^)(CGAffineTransform))cd_transform;
/// 自动调整子视图尺寸，默认YES则会根据autoresizingMask属性自动调整子视图尺寸
- (UIView *(NS_NOESCAPE ^)(BOOL))cd_autoresizesSubviews;
/// 自动调整子视图与父视图的位置，默认UIViewAutoresizingNone
- (UIView *(NS_NOESCAPE ^)(UIViewAutoresizing))cd_autoresizingMask;

- (UIView *(NS_NOESCAPE ^)(UIColor *))cd_shadowColor;
- (UIView *(NS_NOESCAPE ^)(CGSize))cd_shadowOffset;
- (UIView *(NS_NOESCAPE ^)(float))cd_shadowOpacity;
- (UIView *(NS_NOESCAPE ^)(CGFloat))cd_shadowRadius;
- (UIView *(NS_NOESCAPE ^)(CGPathRef))cd_shadowPath;
- (UIView *(NS_NOESCAPE ^)(UIView *))cd_addSubView;


- (UIView * (NS_NOESCAPE ^)(BOOL))cd_opaque;
- (UIView * (NS_NOESCAPE ^)(CGFloat))cd_alpha;
- (UIView * (NS_NOESCAPE ^)(BOOL))cd_masksToBounds;
- (UIView * (^)(UIEdgeInsets))cd_layoutMargins;

- (UIView * (NS_NOESCAPE ^)(UIGestureRecognizer *))cd_addGestureRecognizer;
- (UIView * (NS_NOESCAPE ^)(NSLayoutConstraint *))cd_addConstraint;
- (UIView * (NS_NOESCAPE ^)(NSArray<__kindof NSLayoutConstraint *> *))cd_addConstraints;
@end
