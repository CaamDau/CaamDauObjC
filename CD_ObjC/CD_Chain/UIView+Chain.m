

#import "UIView+Chain.h"

@implementation UIView (Chain)
+ (instancetype)b_init{
    return [[self alloc] init];
}

- (UIView *(^)(CGRect))b_frame{
    return ^(CGRect a) {
        self.frame = a;
        return self;
    };
}

- (UIView *(^)(CGRect))b_bounds{
    return ^(CGRect a) {
        self.bounds = a;
        return self;
    };
}

- (UIView *(^)(CGPoint))b_center{
    return ^(CGPoint a) {
        self.center = a;
        return self;
    };
}

- (UIView * (^)(NSInteger))b_tag{
    return ^(NSInteger a) {
        self.tag = a;
        return self;
    };
}

- (UIView * (^)(BOOL))b_hidden{
    return ^(BOOL a) {
        self.hidden = a;
        return self;
    };
}

- (UIView * (^)(BOOL))b_userInteractionEnabled{
    return ^(BOOL a) {
        self.userInteractionEnabled = a;
        return self;
    };
}

- (UIView *(^)(UIViewContentMode))b_contentMode{
    return ^(UIViewContentMode a) {
        self.contentMode = a;
        return self;
    };
}

- (UIView *(^)(UIColor*))b_bgColor{
    return ^(UIColor* a) {
        self.backgroundColor = a;
        return self;
    };
}

- (UIView *(^)(UIColor*))b_tintColor{
    return ^(UIColor* a) {
        self.tintColor = a;
        return self;
    };
}

- (UIView *(^)(CGFloat))b_borderWidth{
    return ^(CGFloat a) {
        self.layer.borderWidth = a;
        return self;
    };
}
- (UIView *(^)(UIColor*))b_borderColor{
    return ^(UIColor* a) {
        self.layer.borderColor = a.CGColor;
        return self;
    };
}
- (UIView *(^)(CGFloat))b_cornerRadius{
    return ^(CGFloat a) {
        self.layer.cornerRadius = a;
        return self;
    };
}
- (UIView *(^)(BOOL))b_clipsToBounds{
    return ^(BOOL a) {
        self.clipsToBounds = a;
        return self;
    };
}

- (UIView *(^)(CGFloat, BOOL))b_radius_clips{
    return ^(CGFloat a, BOOL c) {
        self.layer.cornerRadius = a;
        self.clipsToBounds = c;
        return self;
    };
}
- (UIView *(^)(UIColor *))b_shadowColor{
    return ^(UIColor *c) {
        self.layer.shadowColor = c.CGColor;
        return self;
    };
}
- (UIView *(^)(CGSize))b_shadowOffset{
    return ^(CGSize a) {
        self.layer.shadowOffset = a;
        return self;
    };
}
- (UIView *(^)(float))b_shadowOpacity{
    return ^(float a) {
        self.layer.shadowOpacity = a;
        return self;
    };
}
- (UIView *(^)(CGFloat))b_shadowRadius{
    return ^(CGFloat a) {
        self.layer.shadowRadius = a;
        return self;
    };
}
- (UIView *(^)(CGPathRef))b_shadowPath{
    return ^(CGPathRef a) {
        self.layer.shadowPath = a;
        return self;
    };
}
/// 变形属性(平移\缩放\旋转)
- (UIView *(^)(CGAffineTransform))b_transform{
    return ^(CGAffineTransform a) {
        self.transform = a;
        return self;
    };
}
/// 自动调整子视图尺寸，默认YES则会根据autoresizingMask属性自动调整子视图尺寸
- (UIView *(^)(BOOL))b_autoresizesSubviews{
    return ^(BOOL a) {
        self.autoresizesSubviews = a;
        return self;
    };
}
/// 自动调整子视图与父视图的位置，默认UIViewAutoresizingNone
- (UIView *(^)(UIViewAutoresizing))b_autoresizingMask{
    return ^(UIViewAutoresizing a) {
        self.autoresizingMask = a;
        return self;
    };
}

- (UIView *(^)(UIView *))b_addSubView{
    return ^(UIView *a) {
        [self addSubview:a];
        return self;
    };
}

- (UIView * (^)(BOOL))b_opaque{
    return ^(BOOL a) {
        self.opaque = a;
        return self;
    };
}
- (UIView * (^)(CGFloat))b_alpha{
    return ^(CGFloat a) {
        self.alpha = a;
        return self;
    };
}

- (UIView * (^)(BOOL))b_masksToBounds{
    return ^(BOOL a) {
        self.layer.masksToBounds = a;
        return self;
    };
}

- (UIView * (^)(UIEdgeInsets))b_layoutMargins{
    return ^(UIEdgeInsets a) {
        self.layoutMargins = a;
        return self;
    };
}

- (UIView * (^)(UIGestureRecognizer *))b_addGestureRecognizer{
    return ^(UIGestureRecognizer *a) {
        [self addGestureRecognizer:a];
        return self;
    };
}

- (UIView * (^)(NSLayoutConstraint *))b_addConstraint{
    return ^(NSLayoutConstraint *a) {
        [self addConstraint:a];
        return self;
    };
}

- (UIView * (^)(NSArray<__kindof NSLayoutConstraint *> *))b_addConstraints{
    return ^(NSArray<__kindof NSLayoutConstraint *> *a) {
        [self addConstraints:a];
        return self;
    };
}
@end
