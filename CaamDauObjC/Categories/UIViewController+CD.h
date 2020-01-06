//
//  UIViewController+CD.h
//  CDKit_OCDemo
//
//  Created by LCD on 2017/11/17.
//  Copyright © 2017年 LCD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CD_VC [UIViewController cd_getViewController]

@interface UIViewController (CD)
+ (instancetype)cd_init;
+ (instancetype)cd_storyboard;
+ (instancetype)cd_storyboard:(NSString*)name;
+ (instancetype)cd_storyboard:(NSString*)name bundleForm:(NSString*)form;

+ (UIViewController *)cd_getViewController;
@end
