

#import "UILabel+Chain.h"

@implementation UILabel (Chain)
- (UILabel * (^)(NSString *))b_text{
    return ^(NSString * a){
        self.text = a;
        return self;
    };
}

- (UILabel * (^)(UIColor *))b_textColor{
    return ^(UIColor * a){
        self.textColor = a;
        return self;
    };
}
- (UILabel * (^)(UIFont *))b_font{
    return ^(UIFont * a){
        self.font = a;
        return self;
    };
}
- (UILabel * (^)(NSTextAlignment))b_alignment{
    return ^(NSTextAlignment a){
        self.textAlignment = a;
        return self;
    };
}
- (UILabel * (^)(NSInteger))b_numberOfLines{
    return ^(NSInteger a){
        self.numberOfLines = a;
        return self;
    };
}

- (UILabel * (^)(NSAttributedString *))b_attributedText{
    return ^(NSAttributedString * a){
        self.attributedText = a;
        return self;
    };
}
- (UILabel * (^)(CGFloat))b_lineSpacing{
    return ^(CGFloat a){
        //富文本属性
        NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
        //基本属性设置
        //字体颜色
        textDict[NSForegroundColorAttributeName] = self.textColor;
        //字号大小
        textDict[NSFontAttributeName] = self.font;
        //段落样式
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        //行间距
        paraStyle.lineSpacing = a;
        //文本段落样式
        textDict[NSParagraphStyleAttributeName] = paraStyle;
        if(self.text.length > 0 ) {
            self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:textDict];
        }else if(self.attributedText.length > 0){
            NSMutableAttributedString * atext = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            [atext setAttributes:textDict range:NSMakeRange(0, self.attributedText.length)];
            self.attributedText = atext;
        }
        return self;
    };
}

- (UILabel * (^)(NSLineBreakMode))b_lineBreakMode{
    return ^(NSLineBreakMode a){
        self.lineBreakMode = a;
        return self;
    };
}

- (UILabel * (^)(UIBaselineAdjustment))b_baselineAdjustment{
    return ^(UIBaselineAdjustment a){
        self.baselineAdjustment = a;
        return self;
    };
}

- (UILabel * (^)(BOOL))b_allowsDefaultTighteningForTruncation{
    return ^(BOOL a){
        self.allowsDefaultTighteningForTruncation = a;
        return self;
    };
}

- (UILabel * (^)(CGFloat))b_preferredMaxLayoutWidth{
    return ^(CGFloat a){
        self.preferredMaxLayoutWidth = a;
        return self;
    };
}

- (UILabel * (^)(BOOL))b_adjustsFontSizeToFitWidth{
    return ^(BOOL a){
        self.adjustsFontSizeToFitWidth = a;
        return self;
    };
}

- (UILabel * (^)(UIColor *))b_highlightedTextColor{
    return ^(UIColor *a){
        self.highlightedTextColor = a;
        return self;
    };
}

- (UILabel * (^)(CGFloat))b_minimumScaleFactor{
    return ^(CGFloat a){
        self.minimumScaleFactor = a;
        return self;
    };
}

@end
