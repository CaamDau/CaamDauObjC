
#import <UIKit/UIKit.h>

@interface UIButton (Chain)
- (UIButton * (NS_NOESCAPE ^)(NSString *))cd_title;
- (UIButton * (NS_NOESCAPE ^)(NSString *, UIControlState))cd_titleState;
- (UIButton * (NS_NOESCAPE ^)(UIColor *))cd_titleColor;
- (UIButton * (NS_NOESCAPE ^)(UIColor *, UIControlState))cd_titleColorState;
- (UIButton * (NS_NOESCAPE ^)(UIFont *))cd_titleFont;
- (UIButton * (NS_NOESCAPE ^)(BOOL))cd_enabled;
- (UIButton * (NS_NOESCAPE ^)(UIImage *))cd_image;
- (UIButton * (NS_NOESCAPE ^)(UIImage *, UIControlState))cd_imageState;
- (UIButton * (NS_NOESCAPE ^)(UIImage *))cd_bgImage;
- (UIButton * (NS_NOESCAPE ^)(UIImage *, UIControlState))cd_bgImageState;
- (UIButton * (NS_NOESCAPE ^)(NSAttributedString *))cd_attributedTitle;
- (UIButton * (NS_NOESCAPE ^)(NSAttributedString *, UIControlState))cd_attributedTitleState;
- (UIButton * (NS_NOESCAPE ^)(CGFloat , CGFloat, CGFloat, CGFloat))cd_titleEdgeInsets;
- (UIButton * (NS_NOESCAPE ^)(CGFloat , CGFloat, CGFloat, CGFloat))cd_imageEdgeInsets;
- (UIButton * (NS_NOESCAPE ^)(UIControlContentHorizontalAlignment))cd_contentHorizontalAlignment;
- (UIButton * (NS_NOESCAPE ^)(UIControlContentVerticalAlignment))cd_contentVerticalAlignment;
- (UIButton * (NS_NOESCAPE ^)(BOOL))cd_reversesTitleShadowWhenHighlighted;
- (UIButton * (NS_NOESCAPE ^)(BOOL))cd_adjustsImageWhenHighlighted;
- (UIButton * (NS_NOESCAPE ^)(BOOL))cd_adjustsImageWhenDisabled;
- (UIButton * (NS_NOESCAPE ^)(BOOL))cd_showsTouchWhenHighlighted;
/// 向Button上添加 Activity loading
- (UIButton * (NS_NOESCAPE ^)(UIColor *bg, UIActivityIndicatorViewStyle st))cd_loading;
/// 向Button上添加 Activity loading 自设坐标
- (UIButton * (^)(UIColor *bg, UIColor *act, UIActivityIndicatorViewStyle st, CGPoint po))cd_loadingC;
/// 将 loading remove
- (UIButton * (NS_NOESCAPE ^)(void))cd_loadingHidden;

/// 向Button上添加 自定义 loading
- (UIButton * (NS_NOESCAPE ^)(void (^)(void)))cd_loadingCustom;
/// 将 指定 loading remove 配合 cd_loadingCustom 使用
- (UIButton * (NS_NOESCAPE ^)(NSInteger))cd_loadingHiddenTag;
@end
