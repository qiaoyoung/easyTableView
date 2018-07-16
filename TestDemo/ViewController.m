//
//  ViewController.m
//  TestDemo
//
//  Created by Joeyoung on 2018/7/16.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "ViewController.h"

#import "QYTableViewDataSource.h"
#import "QYTableViewCell.h"

@interface ViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
/** dataSource */
@property (nonatomic, strong) QYTableViewDataSource *sourceModelObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    
    // 模拟刷新接口
    [self performSelector:@selector(refresh) withObject:nil afterDelay:3.f];
}

- (void)createTableView {
    
    // dataModel
    NSArray *arr = @[@"Tom", @"Rose", @"Lucas", @"Jerry", @"Peter", @"Henry", @"Joe", @"Jack"];
    
    [self.view addSubview:self.tableView];
    static NSString *cellIdentifier = @"cellId";
    self.sourceModelObj = [[QYTableViewDataSource alloc] initWithItems:arr cellIdentifier:cellIdentifier configureCellBlock:^(id cell, id item) {
        // refresh cell
        [cell refreshCellWithModel:item];
    }];
    self.tableView.dataSource = self.sourceModelObj;
    [self.tableView registerClass:[QYTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)refresh {
    NSArray *refreshArr = @[@"refreshTest", @"refreshTest", @"refreshTest"];
    [self.sourceModelObj reloadDataWithItems:refreshArr];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%@",[self.sourceModelObj itemAtIndexPath:indexPath]);
}


#pragma mark - lazy load
- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:rect];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.layer.cornerRadius = YES;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
