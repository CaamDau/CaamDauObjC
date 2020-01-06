

#import "UITableView+CD.h"
#import "NSBundle+CD.h"
@implementation UITableView (CD)

- (UITableViewCell *)cd_cell:(Class)cell bundleFrom:(NSString*)from{
    NSString *identifier = NSStringFromClass(cell);
    UITableViewCell *item = [self dequeueReusableCellWithIdentifier:identifier];
    if (!item) {
        if (from.length == 0) {
            NSString * bundle = [[NSBundle mainBundle] pathForResource:NSStringFromClass(cell) ofType:@"nib"];
            if (bundle) {
                UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
                
                [self registerNib:nib forCellReuseIdentifier:identifier];
            }else{
                [self registerClass:cell forCellReuseIdentifier:identifier];
            }
        }else{
            UINib* nib = [UINib nibWithNibName:identifier bundle:[NSBundle cd_bundleWithClass:cell forResource:from]];
            [self registerNib:nib forCellReuseIdentifier:identifier];
        }
        item = [self dequeueReusableCellWithIdentifier:identifier];
    }
    return item;
}

- (UITableViewHeaderFooterView*)cd_view:(Class)view bundleFrom:(NSString*)from{
    NSString *identifier = NSStringFromClass(view);
    UITableViewHeaderFooterView *v = [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!v) {
        if (from.length == 0) {
            NSString * bundle = [[NSBundle mainBundle] pathForResource:NSStringFromClass(view) ofType:@"nib"];
            if (bundle) {
                UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
                [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
            }else{
                [self registerClass:view forHeaderFooterViewReuseIdentifier:identifier];
            }
        }else{
            UINib* nib = [UINib nibWithNibName:identifier bundle:[NSBundle cd_bundleWithClass:view forResource:from]];
            [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
        }
        v = [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    }
    
    return v;
}
@end
