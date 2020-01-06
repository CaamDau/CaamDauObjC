

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UICollectionView (CD)
- (UICollectionViewCell *)cd_cell:(Class)cell indexPath:(NSIndexPath*)index;
- (UICollectionReusableView *)cd_view:(Class)cell indexPath:(NSIndexPath*)index kind:(NSString*)kind;
- (void)cd_registerClass:(Class)cell bundleFrom:(NSString*)from;
- (void)cd_registerView:(Class)view bundleFrom:(NSString*)from kind:(NSString*)kind;
@end
NS_ASSUME_NONNULL_END
