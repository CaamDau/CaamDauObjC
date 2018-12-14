

#import <UIKit/UIKit.h>

@interface UIAlertController (Chain)
#pragma mark ----- 初始化
/// 初始化 样式 Alert
+ (UIAlertController*)b_alert;
/// 初始化 样式 ActionSheet
+ (UIAlertController*)b_sheet;
/// 初始化
+ (UIAlertController*)b_alert:(UIAlertControllerStyle)style;

#pragma mark ----- 显示
/// 显示 传入 vc
- (UIAlertController *(NS_NOESCAPE ^)(UIViewController* ))b_show;
/// 显示  present 完成后 自定义内容 completion
- (UIAlertController *(NS_NOESCAPE ^)(UIViewController* vc, void (^block)(void)))b_showBlock;

#pragma mark ----- 消失
/// 消失 默认 1.0 秒后
- (void (^)(void))b_hidden;
/// 消失 默认 1.0 秒后 消失后回调 Completion 自定义内容
- (void(^)(void (^)(void)))b_hiddenBlock;
/// 消失 设置延时时间 消失后回调 block 自定义内容
- (void(^)(NSTimeInterval time, void (^block)(void)))b_hiddenTimeBlock;

#pragma mark ----- 标题样式
/// 设置标题
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))b_title;
/// 设置标题字体
- (UIAlertController *(NS_NOESCAPE ^)(UIFont*))b_titleFont;
/// 设置标题颜色
- (UIAlertController *(NS_NOESCAPE ^)(UIColor*))b_titleColor;
/// 设置标题 自定义富文本
- (UIAlertController *(NS_NOESCAPE ^)(NSAttributedString*))b_titleAttributed;
//#pragma mark ----- Msg 样式
/// 设置副标题
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))b_message;
/// 设置副标题字体
- (UIAlertController *(NS_NOESCAPE ^)(UIFont*))b_messageFont;
/// 设置副标题颜色
- (UIAlertController *(NS_NOESCAPE ^)(UIColor*))b_messageColor;
/// 设置副标题 自定义富文本
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))b_messageAttributed;
#pragma mark ----- 按钮
/// 按钮
- (UIAlertController *(NS_NOESCAPE ^)(NSString*))b_action;
/// 按钮 + 回调
- (UIAlertController *(^)(void (^)(UIAlertAction *action)))b_actionHandler;
/// 按钮 + 自定义 回调包含在内
- (UIAlertController *(^)(void(^)(UIAlertAction * action)))b_actionCustom;
@end

@interface UIAlertAction (Chain)
/// 设置按钮文字
- (UIAlertAction *(NS_NOESCAPE ^)(NSString*))b_text;
/// 设置按钮 字体色
- (UIAlertAction *(NS_NOESCAPE ^)(UIColor*))b_textColor;
/// 设置按钮 样式 UIAlertActionStyle
- (UIAlertAction *(NS_NOESCAPE ^)(UIAlertActionStyle))b_style;
/// 点击回调
- (UIAlertAction *(^)(void(^handler)(UIAlertAction * _Nonnull action)))b_handler;
@end
