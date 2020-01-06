# CD_Form  （[Swift版本在这里](https://github.com/liucaide/CD/tree/master/CD/CD_Form)）

## Installation

CD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CD_ObjC/Form'
```

### 无论界面多复杂，都是如下一样的代码，使用这种方式即可轻松完成复杂的 UI 排版,适用所有 UIView，编写可读性、扩展性、维护性强的代码
```ruby
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
```

## Author

liucaide, 565726319@qq.com

## License

CD is available under the MIT license. See the LICENSE file for more info.
