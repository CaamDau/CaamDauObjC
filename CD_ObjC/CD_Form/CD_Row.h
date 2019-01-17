/*** 模块文档 ***
 UI排版 插件
 
 👉👉👉 比如，一个复杂的TableView界面，你的UITableViewDelegate 可能会这样：
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3
        case 1:
            return list.count
            ....
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0){
                return 30
            }else if(indexPath.row == 1){
                return 60
            }else .....
                }
        case 1:
            .....
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0){
                UITableViewCell *cell = .....
                return cell
                }else if(indexPath.row == 1){
                    UITableViewCell *cell = .....
                    return cell
                }else .....
                }
            case 1:
                .....
                }
}
                
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0){
                .....
            }else if(indexPath.row == 1){
                .....
            }else .....
                }
        case 1:
            .....
    }
}

👉👉👉 现在 使用 CD_Row 插件 可以这样， 不再关注UITableViewDelegate 内业务逻辑，其他 UICollectionView 等 UI 同样适用，解放你的控制器 UIViewController
#pragma mark -----  TableViewDelegate -----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.vm.forms.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.vm.forms[section].count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CD_Row *row = self.vm.forms[indexPath.section][indexPath.row];
    return row.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CD_Row *row = self.vm.forms[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView cd_Cell:row.viewClass];
    [row bindView:cell];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CD_Row *row = self.vm.forms[indexPath.section][indexPath.row];
    if (row.didSelectBlock) {
        row.didSelectBlock();
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CD_Row * row = self.vm.formsHead[section];
    return row.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return cd_HeightSectionMin();
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.vm.forms.firstObject.count==0) {
        return nil;
    }
    CD_Row * row = self.vm.formsHead[section];
    UITableViewHeaderFooterView * v = [tableView cd_View:row.viewClass];
    [row bindView:v];
    return v;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
 
 👉👉👉 现在排版 将可以在 ViewModel 这样(摘取一部分)：如果需要进行需求变更，只需要在 ViewModel 适当增删改
#pragma mark ----- 评论 排版
- (void)makeFormReply:(NSArray<M_Comment*>*)list refresh:(BOOL)refresh error:(NSString*)error insert:(BOOL)insert{
    @weakify(self);
    if (refresh) {
        [self.forms[VM_DetailsFormReply] removeAllObjects];
        
        if (list.count == 0) {
            /// 空数据
            CD_Row *row = [[CD_Row alloc] initWithViewClass:[Foot_DetailComment class] viewData:(error.length==0?@"暂无任何评论":error) height:cd_Fit(224)];
            row.callBack = ^(id  _Nonnull any) {
                @strongify(self);
                [self requestReplyListRefresh:YES];
            };
            self.formsHead[VM_DetailsFormReply] = row;
            [self cd_updateRefreshTypes:YES noMore:YES noData:YES];
            if (self.requestBlockReply) {
                self.requestBlockReply();
            }
            return;
        }else{
            CD_Row *row = [[CD_Row alloc] initWithViewClass:[Head_DetailComment class] viewData:@(self.isOrder) height:cd_Fit(43.0)];
            row.callBack = ^(id  _Nonnull any) {
                @strongify(self);
                self.isOrder = !self.isOrder;
                [self requestReplyListRefresh:YES];
            };
            self.formsHead[VM_DetailsFormReply] = row;
            [self cd_updateRefreshTypes:YES noMore:YES noData:YES];
            if (self.requestBlockReply) {
                self.requestBlockReply();
            }
        }
    }
    // - 有数据排版
    __block NSInteger insertB = insert;
    NSMutableArray<CD_Row*> * arr = [NSMutableArray array];
    [list enumerateObjectsUsingBlock:^(M_Comment * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self);
        if (insertB) {
            [self.forms[VM_DetailsFormReply] insertObjects:[self makeRowWithModel:obj] atIndex:0];
        }else{
            [self.forms[VM_DetailsFormReply] addObjectsFromArray:[self makeRowWithModel:obj]];
        }
    }];
    
    [self cd_updateRefreshTypes:refresh noMore:list.count<[key_APIPageSize integerValue] noData:self.forms[VM_DetailsFormReply].count==0];
    if (self.requestBlockReply) {
        self.requestBlockReply();
    }
}

- (NSMutableArray<CD_Row*> *)makeRowWithModel:(M_Comment*)model{
    NSMutableArray<CD_Row*> * arr = [NSMutableArray array];
    @weakify(self, model)
    void (^didSelectBlock)(void) = ^{
        @strongify(model)
        
    };
    { // 分割线
        CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Line class] viewData:model height:cd_Fit(12)];
        [arr addObject:row];
    }
    // 评论者
    [arr addObject:[[CD_Row alloc] initWithViewClass:[Cell_UesrTwo class] viewData:model size:CGSizeMake(0, cd_Fit(30))]];
    
    
    
    { // 分割线
        CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Line class] viewData:model height:cd_Fit(12)];
        [arr addObject:row];
    }
    {// 内容
        CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Content class] viewData:model height:UITableViewAutomaticDimension];
        row.didSelectBlock = didSelectBlock;
        [arr addObject:row];
        
        
    }
    { // 分割线
        CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Line class] viewData:model height:cd_Fit(12)];
        [arr addObject:row];
    }
    if (model.subReply.count>0) {
        [arr addObject:[[CD_Row alloc] initWithViewClass:[Cell_CommentReply class] viewData:model.subReply.firstObject height:UITableViewAutomaticDimension]];
        { // 分割线
            CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Line class] viewData:model height:cd_Fit(12)];
            [arr addObject:row];
        }
    }
    { // 分割线
        CD_Row *row = [[CD_Row alloc] initWithViewClass:[Cell_Line class] viewData:model height:0.5];
        row.tag = Cell_LineTypeBg;
        [arr addObject:row];
    }
    return arr;
}

  👉👉👉 如果需要分组 或 不同类型排版样式不一等。。。。
- (NSMutableArray<NSMutableArray<CD_Row *> *> *)forms{
    if (!_forms) {
        _forms = [NSMutableArray array];
        // 排版分组 - 主内容 - 图片 - 标签&上下页& - 推荐 - 赞 - 评论
        [_forms addObject:[NSMutableArray array]];
        [_forms addObject:[NSMutableArray array]];
        [_forms addObject:[NSMutableArray array]];
        [_forms addObject:[NSMutableArray array]];
        [_forms addObject:[NSMutableArray array]];
        [_forms addObject:[NSMutableArray array]];
    }
    return _forms;
}
- (NSMutableArray<NSMutableArray<CD_Row *> *> *)formsHead{
    if (!_formsHead) {
        _formsHead = [NSMutableArray array];
        // 排版分组 - 主内容 - 图片 - 标签&上下页& - 推荐 - 赞 - 评论
        for (id item in self.forms) {
            CD_Row * row = [[CD_Row alloc] initWithViewClass:[TabHeadFoot_Line class] viewData:@"" height:cd_HeightSectionMin()];
            row.tag = Cell_LineTypeBg;
            [_formsHead addObject:row];
        }
    }
    return _formsHead;
}
*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CD_RowDidSelectBlock)(void);
typedef void (^CD_RowCallBack)(id any);

@protocol CD_RowDelegate <NSObject>
@optional
- (void)row_updateViewData:(id)viewData tag:(NSNumber*)tag;
- (void)row_updateViewData:(id)viewData;
- (void)row_callBack:(CD_RowCallBack)callBack;
@end


@interface CD_Row : NSObject
@property(nonatomic, copy, readonly) NSString *identifier;
/// 数据源 类型 标号 标签 在共用View 等情况下可设置标识
@property(nonatomic, assign) NSInteger tag;
/// Row  size
@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;
/**
 用于UICollectionView sectionInset，
 另 LineSpacing InteritemSpacing 使用 frame - x  y
 用于 UIButton imageEdgeInsets
 */
///UIEdgeInsets
@property(nonatomic, assign) UIEdgeInsets insets;
/// UIEdgeInsets 可用于 UIButton imageEdgeInsets
@property(nonatomic, assign) UIEdgeInsets insetsTitle;
/// view Class 类
@property(nonatomic, strong) Class viewClass;
/// 数据源
@property(nonatomic, strong) id viewData;
/// view 内部事件回调
@property(nonatomic, copy) CD_RowCallBack callBack;
/// view 点击回调
@property(nonatomic, copy) CD_RowDidSelectBlock didSelectBlock;
///
- (instancetype)initWithViewClass:(Class)cls;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData frame:(CGRect)frame;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData size:(CGSize)size;
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData height:(CGFloat)height;


- (void)bindView:(UIView *)view;
@end



NS_ASSUME_NONNULL_END
