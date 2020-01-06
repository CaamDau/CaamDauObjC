//Created  on 2020/1/6 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "Cell_Title.h"
@interface Cell_Title()<CD_RowDelegate>
@end

@implementation Cell_Title

- (void)awakeFromNib {
    [super awakeFromNib];
    
}



- (void)row_updateViewData:(id)data {
    NSString * text = data;
    self.textLabel.text = text;
}
@end
