//Created  on 2020/1/3 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "CD_Form.h"
#import "UITableView+CD.h"
#import "UICollectionView+CD.h"
@implementation CD_Form
- (NSMutableArray<NSMutableArray<CD_Row *> *> *)forms {
    if (!_forms) {
        _forms = [NSMutableArray array];
    }
    return _forms;
}

- (NSMutableArray<CD_Row *> *)headers {
    if (!_headers) {
        _headers = [NSMutableArray array];
    }
    return _headers;
}

- (NSMutableArray<CD_Row *> *)footers {
    if (!_footers) {
        _footers = [NSMutableArray array];
    }
    return _footers;
}

@end







@interface CD_FormDelegateDataSource()
@property (nonatomic, strong, readwrite) CD_Form* form;
@end
@implementation CD_FormDelegateDataSource
- (CD_Form *)form {
    if (!_form) {
        _form = [CD_Form new];
    }
    return _form;
}

- (instancetype)initWithForm:(CD_Form*)form {
    self = [super init];
    if (self) {
        self.form = form;
    }
    return self;
}
@end

@interface CD_FormTableViewDelegateDataSource()
@end

@implementation CD_FormTableViewDelegateDataSource

- (void)makeTableView:(__weak UITableView*)tableView {
    self.form.reloadData = ^{
        __strong UITableView* strongTableView = tableView;
        [strongTableView reloadData];
    };
    
    self.form.reloadRows = ^(NSArray<NSIndexPath *> * _Nonnull rows, UITableViewRowAnimation animation) {
        __strong UITableView* strongTableView = tableView;
        [strongTableView reloadRowsAtIndexPaths:rows withRowAnimation:animation];
    };
    
    self.form.reloadSections = ^(NSIndexSet * _Nonnull sections, UITableViewRowAnimation animation) {
        __strong UITableView* strongTableView = tableView;
        [strongTableView reloadSections:sections withRowAnimation:animation];
    };
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.form.forms.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.form.forms[section].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    return row.height;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView cd_cell:row.viewClass bundleFrom:row.bundleFrom];
    [row bindView:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    if (row.didSelect) {
        row.didSelect();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.form.headers.count > section) {
        CD_Row *row = self.form.headers[section];
        return row.height;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.form.footers.count > section) {
        CD_Row *row = self.form.footers[section];
        return row.height;
    }
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.form.headers.count > section) {
        CD_Row *row = self.form.headers[section];
        UITableViewHeaderFooterView * view = [tableView cd_view:row.viewClass bundleFrom:row.bundleFrom];
        [row bindView:view];
        return view;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.form.footers.count > section) {
        CD_Row *row = self.form.footers[section];
        UITableViewHeaderFooterView * view = [tableView cd_view:row.viewClass bundleFrom:row.bundleFrom];
        [row bindView:view];
        return view;
    }
    return nil;
}
@end


@interface CD_FormCollectionViewDelegateDataSource()

@end

@implementation CD_FormCollectionViewDelegateDataSource

- (void)makeCollectionView:(__weak UICollectionView*)collectionView {
    self.form.reloadData = ^{
        __strong UICollectionView* strongCollectionView = collectionView;
        [strongCollectionView reloadData];
    };
    
    self.form.reloadRows = ^(NSArray<NSIndexPath *> * _Nonnull rows, UITableViewRowAnimation animation) {
        __strong UICollectionView* strongCollectionView = collectionView;
        [strongCollectionView reloadItemsAtIndexPaths:rows];
    };
    
    self.form.reloadSections = ^(NSIndexSet * _Nonnull sections, UITableViewRowAnimation animation) {
        __strong UICollectionView* strongCollectionView = collectionView;
        
        [strongCollectionView reloadSections:sections];
    };
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.form.forms.count;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.form.forms[section].count;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    UICollectionViewCell *cell = [collectionView cd_cell:row.viewClass indexPath:indexPath];
    [row bindView:cell];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    return row.size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CD_Row *row = self.form.forms[indexPath.section][indexPath.row];
    if (row.didSelect) {
        row.didSelect();
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (self.form.headers.count > section) {
        CD_Row *row = self.form.headers[section];
        return row.size;
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (self.form.footers.count > section) {
        CD_Row *row = self.form.footers[section];
        return row.size;
    }
    return CGSizeZero;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader && self.form.headers.count > indexPath.section) {
        CD_Row *row = self.form.headers[indexPath.section];
        UICollectionReusableView * view = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(row.viewClass) forIndexPath:indexPath];
        [row bindView:view];
        return view;
    }else if (kind == UICollectionElementKindSectionFooter && self.form.footers.count > indexPath.section) {
        CD_Row *row = self.form.footers[indexPath.section];
        UICollectionReusableView * view = [collectionView cd_view:row.viewClass indexPath:indexPath kind:kind];
        [row bindView:view];
        return view;
    }else{
        return [collectionView cd_view:CD_CollectionReusableViewNone.class indexPath:indexPath kind:kind];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (self.form.headers.count > section) {
        CD_Row *row = self.form.headers[section];
        return row.frame.origin.y;
    }else if (self.form.forms.count > section && self.form.forms[section].count > 0) {
        return self.form.forms[section].firstObject.frame.origin.y;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (self.form.footers.count > section) {
        CD_Row *row = self.form.footers[section];
        return row.frame.origin.x;
    }else if (self.form.forms.count > section && self.form.forms[section].count > 0) {
        return self.form.forms[section].firstObject.frame.origin.x;
    }
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (self.form.headers.count > section) {
        CD_Row *row = self.form.headers[section];
        return row.insets;
    }
    else if (self.form.footers.count > section) {
        CD_Row *row = self.form.footers[section];
        return row.insets;
    }
    else if (self.form.forms.count > section && self.form.forms[section].count > 0) {
        return self.form.forms[section].firstObject.insets;
    }
    return UIEdgeInsetsZero;
}
@end


@interface CD_CollectionReusableViewNone()<CD_RowDelegate>

@end

@implementation CD_CollectionReusableViewNone

+ (NSString*)bundle {
    return @"CaamDauObjC";
}

- (void)row_callback:(CD_RowCallback)callBack {
    
}
- (void)row_updateConfig:(id)config {
    
}
- (void)row_updateViewData:(id)data {
    
}
@end
