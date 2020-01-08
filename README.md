# CaamDauObjC （[Swift 版本在这里](https://github.com/liucaide/CD)）

[![CI Status](https://img.shields.io/travis/liucaide/CD_ObjC.svg?style=flat)](https://travis-ci.org/liucaide/CD_ObjC)
[![Version](https://img.shields.io/cocoapods/v/CD_ObjC.svg?style=flat)](https://cocoapods.org/pods/CD_ObjC)
[![License](https://img.shields.io/cocoapods/l/CD_ObjC.svg?style=flat)](https://cocoapods.org/pods/CD_ObjC)
[![Platform](https://img.shields.io/cocoapods/p/CD_ObjC.svg?style=flat)](https://cocoapods.org/pods/CD_ObjC)
# 》目前更多关注于Swift版本，OC版本剩余组件暂不整理更新
## 目录
- [CaauDau核心组件](#CaauDau核心组件)
  - [Form流式模型化排版组件](#Form流式模型化排版组件)
  - [Chain链式调用组件](#Chain链式调用组件)
  - [Categories便利性扩展](#Categories便利性扩展)
- [CaauDau第三方扩展组件](#CaauDau第三方扩展组件)
  - [MJRefresh扩展](#MJRefresh扩展)

```ruby
pod 'CaamDauObjC'
```
## CaauDau核心组件
### Form流式模型化排版组件
- 将 delegate、dataSource 设置为 CD_FormTableViewDelegateDataSource
- 当然也可设置为 self ,只需将 CD_FormTableViewDelegateDataSource 内的方法完全复制过来，而不需要做任何更改
```
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
```
- 构建单元格模型：将多点关系的 delegate dataSource 现在转化为单点关系的 模型单元
```
    {// 将多点关系的 delegate dataSource 现在转化为单点关系的 模型单元
        CD_Row *row = [CD_Row rowWithViewClass:[Cell_TableViewXib class] then:^(CD_Row * _Nonnull obj) {
            obj.viewData = @"Cell_TableViewXib";
            obj.config = [UIColor orangeColor];
            obj.height = 60;
            obj.bundleFrom = @"Home";
        }];
        row.callback = ^(id  _Nonnull any) {
            NSLog(@"点击了 %@ Button", any);
        };
        [f addObject:row];
    }
    [self.forms addObject:f];
    
    if (self.reloadData) {
        self.reloadData();
    }
```
### Chain链式调用组件
```
UIAlertController.cd_alert
    .cd_title(@"提示")
    .cd_actionCustom(^(UIAlertAction * a){
        a.cd_text(@"以后再说").cd_textColor(color_Txt_3());
    })
    .cd_actionCustom(^(UIAlertAction * a){
        a.cd_text(@"给个好评")
         .cd_textColor(color_Main_1())
         .cd_handler(^(UIAlertAction * b){
            .....
        });
    })
    .cd_show();
```
### Categories便利性扩展
```
```

## CaauDau第三方扩展组件
### MJRefresh扩展
```
[self.tableView cd_headerAddMJRefresh:^{
    @strongify(self);
    [self.vm requestDataList:YES];
}];
[self.tableView cd_footerAddMJRefreshAuto:^{
    @strongify(self);
    [self.vm requestDataList:NO];
}];
```




## Author

- Email：565726319@qq.com 
- QQ & Wechat：565726319

## License

CaamDauObjC is available under the MIT license. See the LICENSE file for more info.
