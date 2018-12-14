

#import "UIImageView+Chain.h"

@implementation UIImageView (Chain)

- (UIImageView * (^)(UIImage *))cd_image{
    return ^(UIImage *a){
        self.image = a;
        return self;
    };
}

- (UIImageView * (^)(UIImage *))cd_highlightedImage{
    return ^(UIImage *a){
        self.highlightedImage = a;
        return self;
    };
}

- (UIImageView * (^)(BOOL))cd_highlighted{
    return ^(BOOL a){
        self.highlighted = a;
        return self;
    };
}

- (UIImageView * (^)(NSArray<UIImage *> *))cd_animationImages{
    return ^(NSArray<UIImage *> * a){
        self.animationImages = a;
        return self;
    };
}
- (UIImageView * (^)(NSArray<UIImage *> *))cd_highlightedAnimationImages{
    return ^(NSArray<UIImage *> * a){
        self.highlightedAnimationImages = a;
        return self;
    };
}

- (UIImageView * (^)(NSTimeInterval))cd_animationDuration{
    return ^(NSTimeInterval a){
        self.animationDuration = a;
        return self;
    };
}

- (UIImageView * (^)(NSInteger))cd_animationRepeatCount{
    return ^(NSInteger a){
        self.animationRepeatCount = a;
        return self;
    };
}
- (UIImageView * (^)(void))cd_startAnimating{
    return ^(void){
        [self startAnimating];
        return self;
    };
}
- (UIImageView * (^)(void))cd_stopAnimating{
    return ^(void){
        [self stopAnimating];
        return self;
    };
}

- (UIImageView * (^)(NSArray<NSString*> *names, NSTimeInterval t))cd_animateImageNames{
    return ^(NSArray<NSString*> * imgs, NSTimeInterval time){
        NSMutableArray *imgArray = [NSMutableArray array];
        for (NSString * n in imgs) {
            UIImage *image = [UIImage imageNamed:n];
            [imgArray addObject:image];
        }
        self.animationImages = imgArray;
        self.animationDuration = time;
        self.animationRepeatCount = 1;
        [self startAnimating];
        return self;
    };
}

@end
