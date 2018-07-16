//
//  QYTableViewDataSource.m
//  TestDemo
//
//  Created by Joeyoung on 2018/7/16.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYTableViewDataSource.h"

@interface QYTableViewDataSource ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation QYTableViewDataSource

- (instancetype)init {
    return nil;
}

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock {
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = configureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}

- (void)reloadDataWithItems:(NSArray *)items {
    self.items = items;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.items.count-1<indexPath.row) return [UITableViewCell new];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    id item = [self itemAtIndexPath:indexPath];
    if (self.configureCellBlock) self.configureCellBlock(cell, item);
    return cell;
}

@end
