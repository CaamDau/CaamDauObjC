//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "VC_TableViewForm.h"
#import "VM_TableViewForm.h"
@import CaamDauObjC;

@interface VC_TableViewForm ()
@property (nonatomic, strong) VM_TableViewForm *vm;
@property (nonatomic, strong) CD_FormTableViewDelegateDataSource *delegateData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VC_TableViewForm

- (VM_TableViewForm *)vm {
    if (!_vm) {
        _vm = [VM_TableViewForm new];
    }
    return _vm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegateData = [[CD_FormTableViewDelegateDataSource alloc] initWithForm:self.vm];
    self.tableView.delegate = self.delegateData;
    self.tableView.dataSource = self.delegateData;
    
    [self.delegateData makeTableView:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView cd_headerAddMJRefresh:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.vm requestData:YES];
        [strongSelf.tableView cd_endRefreshing];
    }];
    [self.tableView cd_beginRefreshing];
}

@end
