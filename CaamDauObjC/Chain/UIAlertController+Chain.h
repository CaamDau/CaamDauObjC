

#import <UIKit/UIKit.h>

@interface UIAlertController (Chain)
#pragma mark ----- 初始化
/// 初始化 样式 Alert
+ (UIAlertController*)cd_alert;
/// 初始化 样式 ActionSheet
+ (UIAlertController*)cd_sheet;
/// 初始化
+ (UIAlertController*)cd_alert:(UIAlertControllerStyle)style;

#pragma mark ----- 显示
/// 显示 传入 vc
- (UIAlertController *(NS_NOESCAPE ^)(UIViewController* ))cd_show;
/// 显示  present 完成后 自定义内容 completion
- (UIAlertController *(NS_NOESCAPE ^)(UIViewController* vc, void (^block)(void)))cd_showBlock;

#pragma mark ----- 消失
/// 消失 默认 1.0 秒后
- (void (^)(void))cd_hidden;
/// 消失 默认 1.0 秒后 消失后回调 Completion 自定义内容
- (void(^)(void (^)(void)))cd_hiddenBlock;
/// 消失 设置延时时间 消失后回调 block 自定义内容
- (void(^)(NSTimeInterval time, void (^block)(void)))cd_hiddenTimeBlock;

#pragma mark ----- 标题样式
/// 设置标题
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))cd_title;
/// 设置标题字体
- (UIAlertController *(NS_NOESCAPE ^)(UIFont*))cd_titleFont;
/// 设置标题颜色
- (UIAlertController *(NS_NOESCAPE ^)(UIColor*))cd_titleColor;
/// 设置标题 自定义富文本
- (UIAlertController *(NS_NOESCAPE ^)(NSAttributedString*))cd_titleAttributed;
//#pragma mark ----- Msg 样式
/// 设置副标题
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))cd_message;
/// 设置副标题字体
- (UIAlertController *(NS_NOESCAPE ^)(UIFont*))cd_messageFont;
/// 设置副标题颜色
- (UIAlertController *(NS_NOESCAPE ^)(UIColor*))cd_messageColor;
/// 设置副标题 自定义富文本
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))cd_messageAttributed;
#pragma mark ----- 按钮
/// 按钮
- (UIAlertController *(NS_NOESCAPE ^)(NSString*text, void (^handler)(void)))cd_action;

/// 按钮 + 自定义 回调包含在内
- (UIAlertController *(^)(void(^)(UIAlertAction * action)))cd_actionCustom;
@end

@interface UIAlertAction (Chain)
/// 设置按钮文字
- (UIAlertAction *(NS_NOESCAPE ^)(NSString*))cd_text;
/// 设置按钮 字体色
- (UIAlertAction *(NS_NOESCAPE ^)(UIColor*))cd_textColor;
/// 设置按钮 样式 UIAlertActionStyle
- (UIAlertAction *(NS_NOESCAPE ^)(UIAlertActionStyle))cd_style;
/// 点击回调
- (UIAlertAction *(^)(void(^handler)(UIAlertAction * _Nonnull action)))cd_handler;
@end
