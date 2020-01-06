//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "Cell_TableViewXib.h"
@import CaamDauObjC;

@interface Cell_TableViewXib()<CD_RowDelegate>
@property (nonatomic, copy) CD_RowCallback callback;
@end
@implementation Cell_TableViewXib

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (self.callback) {
        self.callback(@"Cell_TableViewXib");
    }
}

- (void)row_callback:(CD_RowCallback)block {
    self.callback = block;
}
- (void)row_updateConfig:(id)config {
    UIColor *color = config;
    self.textLabel.textColor = color;
}
- (void)row_updateViewData:(id)data {
    NSString * text = data;
    self.textLabel.text = text;
}
@end
