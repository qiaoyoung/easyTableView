//
//  QYTableViewDataSource.h
//  TestDemo
//
//  Created by Joeyoung on 2018/7/16.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface QYTableViewDataSource : NSObject<UITableViewDataSource>


- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

/**
 get item

 @param indexPath cellIndexPath
 @return dataModel
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 refresh

 @param items dataModel
 */
- (void)reloadDataWithItems:(NSArray *)items;

@end
