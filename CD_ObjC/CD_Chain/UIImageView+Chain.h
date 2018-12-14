

#import <UIKit/UIKit.h>

@interface UIImageView (Chain)
- (UIImageView * (NS_NOESCAPE ^)(UIImage *))b_image;

- (UIImageView * (NS_NOESCAPE ^)(UIImage *))b_highlightedImage;
- (UIImageView * (NS_NOESCAPE ^)(BOOL))b_highlighted;

- (UIImageView * (NS_NOESCAPE ^)(NSArray<UIImage *> *))b_animationImages;
- (UIImageView * (NS_NOESCAPE ^)(NSArray<UIImage *> *))b_highlightedAnimationImages;

- (UIImageView * (NS_NOESCAPE ^)(NSTimeInterval))b_animationDuration;

- (UIImageView * (NS_NOESCAPE ^)(NSInteger))b_animationRepeatCount;
- (UIImageView * (NS_NOESCAPE ^)(void))b_startAnimating;
- (UIImageView * (NS_NOESCAPE ^)(void))b_stopAnimating;
- (UIImageView * (NS_NOESCAPE ^)(NSArray<NSString*> *names, NSTimeInterval t))b_animateImageNames;

@end
