
#import "UIAlertController+Chain.h"

@implementation UIAlertController (Chain)

#pragma mark ----- 初始化
+ (UIAlertController*)cd_alert{
    return [UIAlertController cd_alert:UIAlertControllerStyleAlert];
}
+ (UIAlertController*)cd_sheet{
    return [UIAlertController cd_alert:UIAlertControllerStyleActionSheet];
}
+ (UIAlertController*)cd_alert:(UIAlertControllerStyle)style{
    return [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:style];
}
#pragma mark ----- 显示
- (UIAlertController *(^)(UIViewController* ))cd_show{
    return ^(UIViewController* vc){
        self.cd_showBlock(vc,nil);
        return self;
    };
}
- (UIAlertController *(^)(UIViewController* vc, void (^block)(void)))cd_showBlock{
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
- (void (^)(void))cd_hidden{
    return ^(void){
        self.cd_hiddenBlock(nil);
    };
}
- (void(^)(void (^)(void)))cd_hiddenBlock{
    return ^(void (^block)(void)){
        self.cd_hiddenTimeBlock(1.0,block);
    };
}
- (void(^)(NSTimeInterval time, void (^block)(void)))cd_hiddenTimeBlock{
    return ^(NSTimeInterval time,void (^block)(void)){
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf dismissViewControllerAnimated:YES completion:block];
        });
    };
    
}
#pragma mark ----- Title 样式
- (UIAlertController *(^)(NSString*))cd_title{
    return ^(NSString* title){
        self.title = title;
        return self;
    };
}
- (UIAlertController *(^)(UIFont*))cd_titleFont{
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
- (UIAlertController *(^)(UIColor*))cd_titleColor{
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
- (UIAlertController *(^)(NSAttributedString*))cd_titleAttributed{
    return ^(NSAttributedString* string){
        [self setValue:string forKey:@"attributedTitle"];
        return self;
    };
}
#pragma mark ----- Msg 样式
- (UIAlertController *(^)(NSString*))cd_message{
    return ^(NSString* message){
        self.message = message;
        return self;
    };
}
- (UIAlertController *(^)(UIFont*))cd_messageFont{
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

- (UIAlertController *(^)(UIColor*))cd_messageColor{
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
- (UIAlertController *(^)(NSString*))cd_messageAttributed{
    return ^(NSString* string){
        [self setValue:string forKey:@"attributedMessage"];
        return self;
    };
}
#pragma mark ----- 按钮
- (UIAlertController *(^)(NSString*text, void (^handler)(void)))cd_action{
    return ^(NSString* t, void (^h)(void)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:t style:0 handler:^(UIAlertAction * _Nonnull action) {
            if (h) {
                h();
            }
        }];
        [self addAction:action];
        return self;
    };
}

- (UIAlertController *(^)(void(^custom)(UIAlertAction * action)))cd_actionCustom{
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

- (UIAlertAction *(^)(NSString*))cd_text{
    return ^(NSString* text){
        if (text) {
            [self setValue:text forKey:@"title"];
        }
        return self;
    };
}
- (UIAlertAction *(^)(UIColor*))cd_textColor{
    return ^(UIColor* color){
        if (color) {
            [self setValue:color forKey:@"titleTextColor"];
        }
        return self;
    };
}

- (UIAlertAction *(^)(UIAlertActionStyle))cd_style{
    return ^(UIAlertActionStyle style){
        [self setValue:@(style) forKey:@"style"];
        return self;
    };
}
- (UIAlertAction *(^)(void(^handler)(UIAlertAction * _Nonnull action)))cd_handler{
    return ^(void(^handler)(UIAlertAction * _Nonnull action)){
        [self setValue:handler forKey:@"handler"];
        return self;
    };
}
@end
