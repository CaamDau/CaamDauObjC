

#import <UIKit/UIKit.h>

@interface UIView (Chain)
+ (instancetype)b_init;

- (UIView *(NS_NOESCAPE ^)(CGRect))b_frame;
- (UIView *(NS_NOESCAPE ^)(CGRect ))b_bounds;
- (UIView *(NS_NOESCAPE ^)(CGPoint ))b_center;
- (UIView *(NS_NOESCAPE ^)(NSInteger))b_tag;
- (UIView *(NS_NOESCAPE ^)(BOOL))b_hidden;
- (UIView *(NS_NOESCAPE ^)(BOOL))b_userInteractionEnabled;
- (UIView *(NS_NOESCAPE ^)(UIViewContentMode))b_contentMode;
/// 背景颜色
- (UIView *(NS_NOESCAPE ^)(UIColor*))b_bgColor;

- (UIView *(NS_NOESCAPE ^)(UIColor*))b_tintColor;
- (UIView *(NS_NOESCAPE ^)(CGFloat))b_borderWidth;
- (UIView *(NS_NOESCAPE ^)(UIColor*))b_borderColor;
- (UIView *(NS_NOESCAPE ^)(CGFloat))b_cornerRadius;
- (UIView *(NS_NOESCAPE ^)(BOOL))b_clipsToBounds;
- (UIView *(NS_NOESCAPE ^)(CGFloat, BOOL))b_radius_clips;

/// 变形属性(平移\缩放\旋转)
- (UIView *(NS_NOESCAPE ^)(CGAffineTransform))b_transform;
/// 自动调整子视图尺寸，默认YES则会根据autoresizingMask属性自动调整子视图尺寸
- (UIView *(NS_NOESCAPE ^)(BOOL))b_autoresizesSubviews;
/// 自动调整子视图与父视图的位置，默认UIViewAutoresizingNone
- (UIView *(NS_NOESCAPE ^)(UIViewAutoresizing))b_autoresizingMask;

- (UIView *(NS_NOESCAPE ^)(UIColor *))b_shadowColor;
- (UIView *(NS_NOESCAPE ^)(CGSize))b_shadowOffset;
- (UIView *(NS_NOESCAPE ^)(float))b_shadowOpacity;
- (UIView *(NS_NOESCAPE ^)(CGFloat))b_shadowRadius;
- (UIView *(NS_NOESCAPE ^)(CGPathRef))b_shadowPath;
- (UIView *(NS_NOESCAPE ^)(UIView *))b_addSubView;


- (UIView * (NS_NOESCAPE ^)(BOOL))b_opaque;
- (UIView * (NS_NOESCAPE ^)(CGFloat))b_alpha;
- (UIView * (NS_NOESCAPE ^)(BOOL))b_masksToBounds;
- (UIView * (^)(UIEdgeInsets))b_layoutMargins;

- (UIView * (NS_NOESCAPE ^)(UIGestureRecognizer *))b_addGestureRecognizer;
- (UIView * (NS_NOESCAPE ^)(NSLayoutConstraint *))b_addConstraint;
- (UIView * (NS_NOESCAPE ^)(NSArray<__kindof NSLayoutConstraint *> *))b_addConstraints;
@end
