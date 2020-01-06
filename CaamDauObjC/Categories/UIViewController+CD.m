//
//  UIViewController+CD.m
//  CDKit_OCDemo
//
//  Created by LCD on 2017/11/17.
//  Copyright © 2017年 LCD. All rights reserved.
//

#import "UIViewController+CD.h"
#import "NSBundle+CD.h"

@implementation UIViewController (CD)

+ (instancetype)cd_init {
    return [[self alloc] init];
}

+ (instancetype)cd_storyboard {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

+ (instancetype)cd_storyboard:(NSString*)name{
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

+ (instancetype)cd_storyboard:(NSString*)name bundleForm:(NSString*)form{
    return [[UIStoryboard storyboardWithName:name bundle:[NSBundle cd_bundleWithClass:self forResource:form]] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

#pragma mark ----- Function 获取当前控制器 -----
+ (UIViewController *)cd_getViewController{
    UIViewController *rootViewController =[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return [UIViewController cd_getVisibleVCFrom:rootViewController];
}
+ (UIViewController *) cd_getVisibleVCFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [UIViewController cd_getVisibleVCFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [UIViewController cd_getVisibleVCFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [UIViewController cd_getVisibleVCFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}
+ (UIViewController*)cd_getTopVCWithRootVC:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [UIViewController cd_getTopVCWithRootVC:tabBarController.selectedViewController];
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [UIViewController cd_getTopVCWithRootVC:presentedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [UIViewController cd_getTopVCWithRootVC:navigationController.visibleViewController];
    } else {
        return rootViewController;
    }
}

@end
