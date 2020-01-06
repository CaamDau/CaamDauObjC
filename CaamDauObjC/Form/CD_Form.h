//Created  on 2020/1/3 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import <Foundation/Foundation.h>
#import "CD_Row.h"
NS_ASSUME_NONNULL_BEGIN


@interface CD_Form : NSObject
@property (nonatomic, strong) NSMutableArray<NSMutableArray<CD_Row*>*>* forms;
@property (nonatomic, strong) NSMutableArray<CD_Row*>* headers;
@property (nonatomic, strong) NSMutableArray<CD_Row*>* footers;

@property (nonatomic, copy) void (^reloadData)(void);
@property (nonatomic, copy) void (^reloadRows)(NSArray<NSIndexPath*>* rows, UITableViewRowAnimation animation);
@property (nonatomic, copy) void (^reloadSections)(NSIndexSet* sections, UITableViewRowAnimation animation);


@end




@interface CD_FormDelegateDataSource : NSObject
@property (nonatomic, strong, readonly) CD_Form* form;

- (instancetype)initWithForm:(CD_Form*)form;
@end


@interface CD_FormTableViewDelegateDataSource : CD_FormDelegateDataSource<UITableViewDelegate, UITableViewDataSource>

- (void)makeTableView:(__weak UITableView*)tableView;

@end


@interface CD_FormCollectionViewDelegateDataSource : CD_FormDelegateDataSource<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
- (void)makeCollectionView:(__weak UICollectionView*)collectionView;
@end


@interface CD_CollectionReusableViewNone : UICollectionReusableView

+ (NSString*)bundle;
@end
NS_ASSUME_NONNULL_END
