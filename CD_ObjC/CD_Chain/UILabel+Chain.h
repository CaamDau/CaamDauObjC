

#import <UIKit/UIKit.h>

@interface UILabel (Chain)
- (UILabel * (NS_NOESCAPE ^)(NSString *))b_text;
- (UILabel * (NS_NOESCAPE ^)(UIColor *))b_textColor;
- (UILabel * (NS_NOESCAPE ^)(UIFont *))b_font;
- (UILabel * (NS_NOESCAPE ^)(NSTextAlignment))b_alignment;
- (UILabel * (NS_NOESCAPE ^)(NSInteger))b_numberOfLines;
- (UILabel * (NS_NOESCAPE ^)(NSAttributedString *))b_attributedText;
/// 行间距、会将lab.text 转化为 lab.attributedText
- (UILabel * (NS_NOESCAPE ^)(CGFloat))b_lineSpacing;
- (UILabel * (NS_NOESCAPE ^)(NSLineBreakMode))b_lineBreakMode;
- (UILabel * (NS_NOESCAPE ^)(UIBaselineAdjustment))b_baselineAdjustment;

- (UILabel * (NS_NOESCAPE ^)(BOOL))b_allowsDefaultTighteningForTruncation;

- (UILabel * (NS_NOESCAPE ^)(CGFloat))b_preferredMaxLayoutWidth;

- (UILabel * (NS_NOESCAPE ^)(BOOL))b_adjustsFontSizeToFitWidth;

- (UILabel * (NS_NOESCAPE ^)(UIColor *))b_highlightedTextColor;

- (UILabel * (NS_NOESCAPE ^)(CGFloat))b_minimumScaleFactor;
@end
