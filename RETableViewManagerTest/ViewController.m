//
//  ViewController.m
//  RETableViewManagerTest
//
//  Created by 业乔集团 on 2018/12/29.
//  Copyright © 2018年 业乔集团. All rights reserved.
//

#import "ViewController.h"
#import "RETableViewManager.h"
#import "Model.h"
#import "ItemTest.h"
#import "TextTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) RETableViewManager *manager;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arrayData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    Model *model = [[Model alloc] init];
    model.name = @"123";
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    [self.view addSubview:self.tableView];
    // Add a section
    //
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
//
    // Add a picker item
    //
//    [section addItem:[REPickerItem itemWithTitle:@"Picker" value:@[@"Item 12", @"Item 23"] placeholder:nil options:@[@[@"Item 11", @"Item 12", @"Item 13"], @[@"Item 21", @"Item 22", @"Item 23", @"Item 24"]]]];
    ItemTest *test = [[ItemTest alloc] init];
    test.modelFFF = (Model *)model;
    [section addItem:test];
     
     [self.tableView reloadData];
    
    [test setSelectionHandler:^(ItemTest *item) {
        NSLog(@"bbbbb = %@", item.modelFFF.name);
    }];
    
//    self.manager[@"ItemTest"] = @"TextTableViewCell";
    
    [self.manager registerClass:@"ItemTest" forCellWithReuseIdentifier:@"TextTableViewCell"];
    
}

- (RETableViewManager *)manager {
    if (!_manager) {
        if ([self.tableView isKindOfClass:[UITableView class]]) {
            _manager = [[RETableViewManager alloc] initWithTableView:(UITableView *)self.tableView delegate:(id<RETableViewManagerDelegate>)self];
        }
    }
    return _manager;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    }
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    return _tableView;
}

@end
