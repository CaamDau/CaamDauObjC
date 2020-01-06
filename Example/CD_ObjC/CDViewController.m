//
//  CDViewController.m
//  CD_ObjC
//
//  Created by liucaide on 12/15/2018.
//  Copyright (c) 2018 liucaide. All rights reserved.
//

#import "CDViewController.h"
#import <Home/R_Home.h>
#import "Cell_Title.h"
@interface CDViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CD_Form * datas;
@property (nonatomic, strong) CD_FormTableViewDelegateDataSource *delegateData;
@end

@implementation CDViewController
- (CD_Form *)datas {
    if (!_datas) {
        _datas = [CD_Form new];
    }
    return _datas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegateData = [[CD_FormTableViewDelegateDataSource alloc] initWithForm:self.datas];
    self.tableView.delegate = self.delegateData;
    self.tableView.dataSource = self.delegateData;
    
    [self.delegateData makeTableView:self.tableView];
    [self makeForm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}




- (void)makeForm {
    NSMutableArray<CD_Row*> * f = [NSMutableArray array];
    {
        CD_Row *row = [CD_Row rowWithViewClass:[Cell_Title class] then:^(CD_Row * _Nonnull obj) {
            obj.viewData = @"Form";
            obj.height = 45;
            obj.bundleFrom = @"Home";
        }];
        row.didSelect = ^{
            [R_Home tableViewForm];
        };
        [f addObject:row];
    }
    [self.datas.forms addObject:f];
    self.datas.reloadData();
}
@end



