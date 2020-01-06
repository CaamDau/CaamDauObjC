//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "VM_TableViewForm.h"
#import "Cell_TableView.h"
#import "Cell_TableViewClass.h"
#import "Cell_TableViewXib.h"



@implementation VM_TableViewForm

- (void)makeForm {
    NSMutableArray<CD_Row*> * f = [NSMutableArray array];
    {
        CD_Row *row = [CD_Row rowWithViewClass:[Cell_TableView class] then:^(CD_Row * _Nonnull obj) {
            obj.viewData = @"Cell_TableView";
            obj.config = [UIColor redColor];
            obj.height = 80;
            obj.bundleFrom = @"Home";
        }];
        [f addObject:row];
    }
    {
        CD_Row *row = [CD_Row rowWithViewClass:[Cell_TableViewClass class] then:^(CD_Row * _Nonnull obj) {
            obj.viewData = @"Cell_TableViewClass";
            obj.config = [UIColor blueColor];
            obj.height = 130;
            
        }];
        [f addObject:row];
    }
    {
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
    
}



- (void)requestData:(BOOL)refresh {
    
    [self makeForm];
}
@end
