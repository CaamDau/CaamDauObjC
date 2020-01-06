

#import "UICollectionView+CD.h"
#import "NSBundle+CD.h"
@implementation UICollectionView (CD)

- (UICollectionViewCell *)cd_cell:(Class)cell indexPath:(NSIndexPath*)index{
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cell) forIndexPath:index];
}

- (UICollectionReusableView *)cd_view:(Class)cell indexPath:(NSIndexPath*)index kind:(NSString*)kind{
    return [self dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(cell) forIndexPath:index];
}

- (void)cd_registerClass:(Class)cell bundleFrom:(NSString*)from{
    NSString *identifier = NSStringFromClass(cell);
    if (from.length == 0) {
        NSString *bu = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
        if (bu) {
            UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
            [self registerNib:nib forCellWithReuseIdentifier:identifier];
        }else{
            [self registerClass:cell forCellWithReuseIdentifier:NSStringFromClass(cell)];
        }
    }else {
        UINib* nib = [UINib nibWithNibName:identifier bundle:[NSBundle cd_bundleWithClass:cell forResource:from]];
        [self registerNib:nib forCellWithReuseIdentifier:identifier];
    }
}

- (void)cd_registerView:(Class)view bundleFrom:(NSString*)from kind:(NSString*)kind{
    NSString *identifier = NSStringFromClass(view);
    if (from.length == 0) {
        NSString *bu = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
        if (bu) {
            UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
            [self registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
        }else{
            [self registerClass:view forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
        }
    }else {
        UINib* nib = [UINib nibWithNibName:identifier bundle:[NSBundle cd_bundleWithClass:view forResource:from]];
        [self registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
    }
}
@end
