//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "Cell_TableView.h"
@import CaamDauObjC;

@interface Cell_TableView()<CD_RowDelegate>
@end
@implementation Cell_TableView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)row_updateViewData:(id)data {
    NSString * text = data;
    self.textLabel.text = text;
}
- (void)row_updateConfig:(id)config {
    UIColor *color = config;
    self.textLabel.textColor = color;
}
@end
