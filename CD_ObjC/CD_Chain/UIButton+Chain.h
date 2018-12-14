
#import <UIKit/UIKit.h>

@interface UIButton (Chain)
- (UIButton * (NS_NOESCAPE ^)(NSString *))b_title;
- (UIButton * (NS_NOESCAPE ^)(NSString *, UIControlState))b_titleState;
- (UIButton * (NS_NOESCAPE ^)(UIColor *))b_titleColor;
- (UIButton * (NS_NOESCAPE ^)(UIColor *, UIControlState))b_titleColorState;
- (UIButton * (NS_NOESCAPE ^)(UIFont *))b_titleFont;
- (UIButton * (NS_NOESCAPE ^)(UIImage *))b_image;
- (UIButton * (NS_NOESCAPE ^)(UIImage *, UIControlState))b_imageState;
- (UIButton * (NS_NOESCAPE ^)(UIImage *))b_bgImage;
- (UIButton * (NS_NOESCAPE ^)(UIImage *, UIControlState))b_bgImageState;
- (UIButton * (NS_NOESCAPE ^)(NSAttributedString *))b_attributedTitle;
- (UIButton * (NS_NOESCAPE ^)(NSAttributedString *, UIControlState))b_attributedTitleState;
- (UIButton * (NS_NOESCAPE ^)(CGFloat , CGFloat, CGFloat, CGFloat))b_titleEdgeInsets;
- (UIButton * (NS_NOESCAPE ^)(CGFloat , CGFloat, CGFloat, CGFloat))b_imageEdgeInsets;
- (UIButton * (NS_NOESCAPE ^)(UIControlContentHorizontalAlignment))b_contentHorizontalAlignment;
- (UIButton * (NS_NOESCAPE ^)(UIControlContentVerticalAlignment))b_contentVerticalAlignment;
- (UIButton * (NS_NOESCAPE ^)(BOOL))b_reversesTitleShadowWhenHighlighted;
- (UIButton * (NS_NOESCAPE ^)(BOOL))b_adjustsImageWhenHighlighted;
- (UIButton * (NS_NOESCAPE ^)(BOOL))b_adjustsImageWhenDisabled;
- (UIButton * (NS_NOESCAPE ^)(BOOL))b_showsTouchWhenHighlighted;
/// 向Button上添加 Activity loading
- (UIButton * (NS_NOESCAPE ^)(UIColor *bg, UIActivityIndicatorViewStyle st))b_loading;
/// 向Button上添加 Activity loading 自设坐标
- (UIButton * (^)(UIColor *bg, UIColor *act, UIActivityIndicatorViewStyle st, CGPoint po))b_loadingC;
/// 将 loading remove
- (UIButton * (NS_NOESCAPE ^)(void))b_loadingHidden;

/// 向Button上添加 自定义 loading
- (UIButton * (NS_NOESCAPE ^)(void (^)(void)))b_loadingCustom;
/// 将 指定 loading remove 配合 b_loadingCustom 使用
- (UIButton * (NS_NOESCAPE ^)(NSInteger))b_hiddenLoadingTag;
@end
