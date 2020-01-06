

#import <UIKit/UIKit.h>

@interface UIImageView (Chain)
- (UIImageView * (NS_NOESCAPE ^)(UIImage *))cd_image;

- (UIImageView * (NS_NOESCAPE ^)(UIImage *))cd_highlightedImage;
- (UIImageView * (NS_NOESCAPE ^)(BOOL))cd_highlighted;

- (UIImageView * (NS_NOESCAPE ^)(NSArray<UIImage *> *))cd_animationImages;
- (UIImageView * (NS_NOESCAPE ^)(NSArray<UIImage *> *))cd_highlightedAnimationImages;

- (UIImageView * (NS_NOESCAPE ^)(NSTimeInterval))cd_animationDuration;

- (UIImageView * (NS_NOESCAPE ^)(NSInteger))cd_animationRepeatCount;
- (UIImageView * (NS_NOESCAPE ^)(void))cd_startAnimating;
- (UIImageView * (NS_NOESCAPE ^)(void))cd_stopAnimating;
- (UIImageView * (NS_NOESCAPE ^)(NSArray<NSString*> *names, NSTimeInterval t))cd_animateImageNames;

@end
