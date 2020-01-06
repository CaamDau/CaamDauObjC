//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "Cell_TableViewClass.h"
@import CaamDauObjC;
@interface Cell_TableViewClass()<CD_RowDelegate>
@end
@implementation Cell_TableViewClass

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
