
#import "UIButton+Chain.h"

@implementation UIButton (Chain)
- (UIButton * (^)(NSString *))b_title{
    return ^(NSString * a){
        self.b_titleState(a,UIControlStateNormal);
        return self;
    };
}

- (UIButton * (^)(NSString *, UIControlState))b_titleState{
    return ^(NSString *a, UIControlState b){
        [self setTitle:a forState:b];
        return self;
    };
}

- (UIButton * (^)(UIColor *))b_titleColor{
    return ^(UIColor * a){
        self.b_titleColorState(a,UIControlStateNormal);
        return self;
    };
}

- (UIButton * (^)(UIColor *, UIControlState))b_titleColorState{
    return ^(UIColor *a, UIControlState b){
        [self setTitleColor:a forState:b];
        return self;
    };
}

- (UIButton * (^)(UIFont *))b_titleFont{
    return ^(UIFont *a){
        self.titleLabel.font = a;
        return self;
    };
}

- (UIButton * (^)(UIImage *))b_image{
    return ^(UIImage *a){
        [self setImage:a forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIImage *, UIControlState))b_imageState{
    return ^(UIImage *a, UIControlState b){
        [self setImage:a forState:b];
        return self;
    };
}

- (UIButton * (^)(UIImage *))b_bgImage{
    return ^(UIImage *a){
        [self setBackgroundImage:a forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIImage *, UIControlState))b_bgImageState{
    return ^(UIImage *a, UIControlState b){
        [self setBackgroundImage:a forState:b];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *))b_attributedTitle{
    return ^(NSAttributedString * a){
        [self setAttributedTitle:a forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * (^)(NSAttributedString *, UIControlState))b_attributedTitleState{
    return ^(NSAttributedString * a, UIControlState b){
        [self setAttributedTitle:a forState:b];
        return self;
    };
}

- (UIButton * (^)(CGFloat , CGFloat, CGFloat, CGFloat))b_titleEdgeInsets{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (UIButton * (^)(CGFloat , CGFloat, CGFloat, CGFloat))b_imageEdgeInsets{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);;
        return self;
    };
}


- (UIButton * (^)(UIControlContentHorizontalAlignment))b_contentHorizontalAlignment{
    return ^(UIControlContentHorizontalAlignment a){
        self.contentHorizontalAlignment = a;
        return self;
    };
}
- (UIButton * (^)(UIControlContentVerticalAlignment))b_contentVerticalAlignment{
    return ^(UIControlContentVerticalAlignment a){
        self.contentVerticalAlignment = a;
        return self;
    };
}


- (UIButton * (^)(BOOL))b_reversesTitleShadowWhenHighlighted{
    return ^(BOOL a){
        self.reversesTitleShadowWhenHighlighted = a;
        return self;
    };
}
- (UIButton * (^)(BOOL))b_adjustsImageWhenHighlighted{
    return ^(BOOL a){
        self.adjustsImageWhenHighlighted = a;
        return self;
    };
}
- (UIButton * (^)(BOOL))b_adjustsImageWhenDisabled{
    return ^(BOOL a){
        self.adjustsImageWhenDisabled = a;
        return self;
    };
}
- (UIButton * (^)(BOOL))b_showsTouchWhenHighlighted{
    return ^(BOOL a){
        self.showsTouchWhenHighlighted = a;
        return self;
    };
}


- (UIButton * (^)(UIColor *bg, UIActivityIndicatorViewStyle st))b_loading{
    return ^(UIColor * b, UIActivityIndicatorViewStyle s){
        self.enabled = NO;
        UIView * v = [UIView new];
        v.frame = self.bounds;
        v.tag = -8668;
        v.backgroundColor = b;
        [self addSubview:v];
        UIActivityIndicatorView * act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:s];
        act.frame = v.bounds;
        [act startAnimating];
        [v addSubview:act];
        return self;
    };
}

- (UIButton * (^)(UIColor *bg, UIColor *act, UIActivityIndicatorViewStyle st, CGPoint po))b_loadingC{
    return ^(UIColor * b, UIColor *act, UIActivityIndicatorViewStyle s, CGPoint p){
        self.enabled = NO;
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:s];
        [activity startAnimating];
        UIView * v = [UIView new];
        v.center = p;
        v.bounds = activity.bounds;
        v.tag = -8668;
        v.backgroundColor = b;
        activity.color = act;
        activity.frame = v.bounds;
        [self addSubview:v];
        [v addSubview:activity];
        return self;
    };
}
/// 向Button上添加 Activity loading 自定义Activity
- (UIButton * (^)(void (^)(void)))b_loadingCustom{
    return ^( void (^custom)(void)){
        if (custom) {
            custom();
        }
        return self;
    };
}

- (UIButton * (^)(void))b_loadingHidden{
    return ^(void){
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.tag == -8668) {
                [obj removeFromSuperview];
                *stop = YES;
            }
        }];
        self.enabled = YES;
        return self;
    };
}

- (UIButton * (^)(NSInteger))b_hiddenLoadingTag{
    return ^(NSInteger tag){
        __block NSInteger t = tag;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.tag == t) {
                [obj removeFromSuperview];
                *stop = YES;
            }
        }];
        self.enabled = YES;
        return self;
    };
}

@end
