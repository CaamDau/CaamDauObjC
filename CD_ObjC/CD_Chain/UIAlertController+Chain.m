
#import "UIAlertController+Chain.h"

@implementation UIAlertController (Chain)

#pragma mark ----- 初始化
+ (UIAlertController*)b_alert{
    return [UIAlertController b_alert:UIAlertControllerStyleAlert];
}
+ (UIAlertController*)b_sheet{
    return [UIAlertController b_alert:UIAlertControllerStyleActionSheet];
}
+ (UIAlertController*)b_alert:(UIAlertControllerStyle)style{
    return [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:style];
}
#pragma mark ----- 显示
- (UIAlertController *(^)(UIViewController* ))b_show{
    return ^(UIViewController* vc){
        self.b_showBlock(vc,nil);
        return self;
    };
}
- (UIAlertController *(^)(UIViewController* vc, void (^block)(void)))b_showBlock{
    return ^id(UIViewController* vc, void (^block)(void)){
        if (!self.title && !self.message && self.actions.count==0) {
            NSLog(@"💀💀大哥！你别这样，什么东西都不放，俺会崩溃的💀💀");
            return nil;
        }
        if (!vc) {
            NSLog(@"💀💀大哥！你别这样， 告诉我从哪里弹出来呀💀💀");
        }
        [vc presentViewController:self animated:YES completion:block];
        return self;
    };
}

#pragma mark ----- 消失
- (void (^)(void))b_hidden{
    return ^(void){
        self.b_hiddenBlock(nil);
    };
}
- (void(^)(void (^)(void)))b_hiddenBlock{
    return ^(void (^block)(void)){
        self.b_hiddenTimeBlock(1.0,block);
    };
}
- (void(^)(NSTimeInterval time, void (^block)(void)))b_hiddenTimeBlock{
    return ^(NSTimeInterval time,void (^block)(void)){
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf dismissViewControllerAnimated:YES completion:block];
        });
    };
    
}
#pragma mark ----- Title 样式
- (UIAlertController *(^)(NSString*))b_title{
    return ^(NSString* title){
        self.title = title;
        return self;
    };
}
- (UIAlertController *(^)(UIFont*))b_titleFont{
    return ^(UIFont* font){
        if (self.title.length>0) {
            NSAttributedString * attributedMessage = [self valueForKey:@"attributedTitle"];
            NSMutableAttributedString *attributedString;
            if (attributedMessage) {
                attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedMessage];
            }else{
                attributedString = [[NSMutableAttributedString alloc] initWithString:self.title];
            }
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
            [self setValue:attributedString forKey:@"attributedTitle"];
        }
        return self;
    };
}
- (UIAlertController *(^)(UIColor*))b_titleColor{
    return ^(UIColor* color){
        if (self.title.length>0) {
            NSAttributedString * attributedMessage = [self valueForKey:@"attributedTitle"];
            NSMutableAttributedString *attributedString;
            if (attributedMessage) {
                attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedMessage];
            }else{
                attributedString = [[NSMutableAttributedString alloc] initWithString:self.title];
            }
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
            [self setValue:attributedString forKey:@"attributedTitle"];
        }
        return self;
    };
}
- (UIAlertController *(^)(NSAttributedString*))b_titleAttributed{
    return ^(NSAttributedString* string){
        [self setValue:string forKey:@"attributedTitle"];
        return self;
    };
}
#pragma mark ----- Msg 样式
- (UIAlertController *(^)(NSString*))b_message{
    return ^(NSString* message){
        self.message = message;
        return self;
    };
}
- (UIAlertController *(^)(UIFont*))b_messageFont{
    return ^(UIFont* font){
        if (self.message.length>0) {
            NSAttributedString * attributedMessage = [self valueForKey:@"attributedMessage"];
            NSMutableAttributedString *attributedString;
            if (attributedMessage) {
                attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedMessage];
            }else{
                attributedString = [[NSMutableAttributedString alloc] initWithString:self.message];
            }
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
            [self setValue:attributedString forKey:@"attributedMessage"];
        }
        return self;
    };
}

- (UIAlertController *(^)(UIColor*))b_messageColor{
    return ^(UIColor* color){
        if (self.message.length>0) {
            NSAttributedString * attributedMessage = [self valueForKey:@"attributedMessage"];
            NSMutableAttributedString *attributedString;
            if (attributedMessage) {
                attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedMessage];
            }else{
                attributedString = [[NSMutableAttributedString alloc] initWithString:self.message];
            }
            
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
            [self setValue:attributedString forKey:@"attributedMessage"];
        }
        return self;
    };
}
- (UIAlertController *(^)(NSString*))b_messageAttributed{
    return ^(NSString* string){
        [self setValue:string forKey:@"attributedMessage"];
        return self;
    };
}
#pragma mark ----- 按钮
- (UIAlertController *(^)(NSString*))b_action{
    return ^(NSString* text){
        UIAlertAction * action = [UIAlertAction actionWithTitle:text style:0 handler:nil];
        [self addAction:action];
        return self;
    };
}
- (UIAlertController *(^)(void (^)(UIAlertAction *action)))b_actionHandler{
    return ^(void (^handler)(UIAlertAction *action)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"" style:0 handler:handler];
        [self addAction:action];
        return self;
    };
}
- (UIAlertController *(^)(void(^custom)(UIAlertAction * action)))b_actionCustom{
    return ^(void(^custom)(UIAlertAction * action)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"" style:0 handler:nil];
        if (custom) {
            custom(action);
        }
        [self addAction:action];
        return self;
    };
}
@end


@implementation UIAlertAction (Chain)

- (UIAlertAction *(^)(NSString*))b_text{
    return ^(NSString* text){
        if (text) {
            [self setValue:text forKey:@"title"];
        }
        return self;
    };
}
- (UIAlertAction *(^)(UIColor*))b_textColor{
    return ^(UIColor* color){
        if (color) {
            [self setValue:color forKey:@"titleTextColor"];
        }
        return self;
    };
}

- (UIAlertAction *(^)(UIAlertActionStyle))b_style{
    return ^(UIAlertActionStyle style){
        [self setValue:@(style) forKey:@"style"];
        return self;
    };
}
- (UIAlertAction *(^)(void(^handler)(UIAlertAction * _Nonnull action)))b_handler{
    return ^(void(^handler)(UIAlertAction * _Nonnull action)){
        [self setValue:handler forKey:@"handler"];
        return self;
    };
}
@end
