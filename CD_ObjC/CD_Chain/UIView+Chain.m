

#import "UIView+Chain.h"

@implementation UIView (Chain)
+ (instancetype)cd_init{
    return [[self alloc] init];
}

- (UIView *(^)(CGRect))cd_frame{
    return ^(CGRect a) {
        self.frame = a;
        return self;
    };
}

- (UIView *(^)(CGRect))cd_bounds{
    return ^(CGRect a) {
        self.bounds = a;
        return self;
    };
}

- (UIView *(^)(CGPoint))cd_center{
    return ^(CGPoint a) {
        self.center = a;
        return self;
    };
}

- (UIView * (^)(NSInteger))cd_tag{
    return ^(NSInteger a) {
        self.tag = a;
        return self;
    };
}

- (UIView * (^)(BOOL))cd_hidden{
    return ^(BOOL a) {
        self.hidden = a;
        return self;
    };
}

- (UIView * (^)(BOOL))cd_userInteractionEnabled{
    return ^(BOOL a) {
        self.userInteractionEnabled = a;
        return self;
    };
}

- (UIView *(^)(UIViewContentMode))cd_contentMode{
    return ^(UIViewContentMode a) {
        self.contentMode = a;
        return self;
    };
}

- (UIView *(^)(UIColor*))cd_bgColor{
    return ^(UIColor* a) {
        self.backgroundColor = a;
        return self;
    };
}

- (UIView *(^)(UIColor*))cd_tintColor{
    return ^(UIColor* a) {
        self.tintColor = a;
        return self;
    };
}

- (UIView *(^)(CGFloat))cd_borderWidth{
    return ^(CGFloat a) {
        self.layer.borderWidth = a;
        return self;
    };
}
- (UIView *(^)(UIColor*))cd_borderColor{
    return ^(UIColor* a) {
        self.layer.borderColor = a.CGColor;
        return self;
    };
}
- (UIView *(^)(CGFloat))cd_cornerRadius{
    return ^(CGFloat a) {
        self.layer.cornerRadius = a;
        return self;
    };
}
- (UIView *(^)(BOOL))cd_clipsToBounds{
    return ^(BOOL a) {
        self.clipsToBounds = a;
        return self;
    };
}

- (UIView *(^)(CGFloat, BOOL))cd_radius_clips{
    return ^(CGFloat a, BOOL c) {
        self.layer.cornerRadius = a;
        self.clipsToBounds = c;
        return self;
    };
}
///设置部分圆角(绝对布局)
- (UIView *(^)(UIRectCorner, CGSize))cd_byRoundedCornersRadii{
    return ^(UIRectCorner a, CGSize c) {
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:a cornerRadii:c];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        self.layer.mask = shape;
        return self;
    };
}
///设置部分圆角(相对布局)
- (UIView *(^)(CGRect, UIRectCorner, CGSize))cd_byRoundedRectCornersRadii{
    return ^( CGRect r, UIRectCorner a, CGSize c) {
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:r byRoundingCorners:a cornerRadii:c];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        self.layer.mask = shape;
        return self;
    };
}





- (UIView *(^)(UIColor *))cd_shadowColor{
    return ^(UIColor *c) {
        self.layer.shadowColor = c.CGColor;
        return self;
    };
}
- (UIView *(^)(CGSize))cd_shadowOffset{
    return ^(CGSize a) {
        self.layer.shadowOffset = a;
        return self;
    };
}
- (UIView *(^)(float))cd_shadowOpacity{
    return ^(float a) {
        self.layer.shadowOpacity = a;
        return self;
    };
}
- (UIView *(^)(CGFloat))cd_shadowRadius{
    return ^(CGFloat a) {
        self.layer.shadowRadius = a;
        return self;
    };
}
- (UIView *(^)(CGPathRef))cd_shadowPath{
    return ^(CGPathRef a) {
        self.layer.shadowPath = a;
        return self;
    };
}
/// 变形属性(平移\缩放\旋转)
- (UIView *(^)(CGAffineTransform))cd_transform{
    return ^(CGAffineTransform a) {
        self.transform = a;
        return self;
    };
}
/// 自动调整子视图尺寸，默认YES则会根据autoresizingMask属性自动调整子视图尺寸
- (UIView *(^)(BOOL))cd_autoresizesSubviews{
    return ^(BOOL a) {
        self.autoresizesSubviews = a;
        return self;
    };
}
/// 自动调整子视图与父视图的位置，默认UIViewAutoresizingNone
- (UIView *(^)(UIViewAutoresizing))cd_autoresizingMask{
    return ^(UIViewAutoresizing a) {
        self.autoresizingMask = a;
        return self;
    };
}

- (UIView *(^)(UIView *))cd_addSubView{
    return ^(UIView *a) {
        [self addSubview:a];
        return self;
    };
}

- (UIView * (^)(BOOL))cd_opaque{
    return ^(BOOL a) {
        self.opaque = a;
        return self;
    };
}
- (UIView * (^)(CGFloat))cd_alpha{
    return ^(CGFloat a) {
        self.alpha = a;
        return self;
    };
}

- (UIView * (^)(BOOL))cd_masksToBounds{
    return ^(BOOL a) {
        self.layer.masksToBounds = a;
        return self;
    };
}

- (UIView * (^)(UIEdgeInsets))cd_layoutMargins{
    return ^(UIEdgeInsets a) {
        self.layoutMargins = a;
        return self;
    };
}

- (UIView * (^)(UIGestureRecognizer *))cd_addGestureRecognizer{
    return ^(UIGestureRecognizer *a) {
        [self addGestureRecognizer:a];
        return self;
    };
}

- (UIView * (^)(NSLayoutConstraint *))cd_addConstraint{
    return ^(NSLayoutConstraint *a) {
        [self addConstraint:a];
        return self;
    };
}

- (UIView * (^)(NSArray<__kindof NSLayoutConstraint *> *))cd_addConstraints{
    return ^(NSArray<__kindof NSLayoutConstraint *> *a) {
        [self addConstraints:a];
        return self;
    };
}
@end
