

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UITableView (CD)
- (UITableViewCell *)cd_cell:(Class)cell bundleFrom:(NSString*)from;
- (UITableViewHeaderFooterView *)cd_view:(Class)view bundleFrom:(NSString*)from;
@end
NS_ASSUME_NONNULL_END
