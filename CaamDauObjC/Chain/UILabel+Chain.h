

#import <UIKit/UIKit.h>

@interface UILabel (Chain)
- (UILabel * (NS_NOESCAPE ^)(NSString *))cd_text;
- (UILabel * (NS_NOESCAPE ^)(UIColor *))cd_textColor;
- (UILabel * (NS_NOESCAPE ^)(UIFont *))cd_font;
- (UILabel * (NS_NOESCAPE ^)(NSTextAlignment))cd_alignment;
- (UILabel * (NS_NOESCAPE ^)(NSInteger))cd_numberOfLines;
- (UILabel * (NS_NOESCAPE ^)(NSAttributedString *))cd_attributedText;
/// 行间距、会将lab.text 转化为 lab.attributedText
- (UILabel * (NS_NOESCAPE ^)(CGFloat))cd_lineSpacing;
- (UILabel * (NS_NOESCAPE ^)(NSLineBreakMode))cd_lineBreakMode;
- (UILabel * (NS_NOESCAPE ^)(UIBaselineAdjustment))cd_baselineAdjustment;

- (UILabel * (NS_NOESCAPE ^)(BOOL))cd_allowsDefaultTighteningForTruncation;

- (UILabel * (NS_NOESCAPE ^)(CGFloat))cd_preferredMaxLayoutWidth;

- (UILabel * (NS_NOESCAPE ^)(BOOL))cd_adjustsFontSizeToFitWidth;

- (UILabel * (NS_NOESCAPE ^)(UIColor *))cd_highlightedTextColor;

- (UILabel * (NS_NOESCAPE ^)(CGFloat))cd_minimumScaleFactor;
@end
