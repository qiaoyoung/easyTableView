# easyTableView

### 使用方法：
``` 
static NSString *cellIdentifier = @"cellId";
self.sourceModelObj = [[QYTableViewDataSource alloc] initWithItems:arr cellIdentifier:cellIdentifier configureCellBlock:^(id cell, id item) {
    // cell doSomething
    
}];
self.tableView.dataSource = self.sourceModelObj;
[self.tableView registerClass:[<#CellName#> class] forCellReuseIdentifier:cellIdentifier];
```
-  分离了controller中UITableViewDataSource的实现，将其放在了*QYTableViewDataSource*类中；
-  仿照此思想也可以实现UICollectionViewDataSource的分离；
- 因为原作者并未提供刷新表格的方法，我在*QYTableViewDataSource*类中开辟方法以供刷新使用；`- (void)reloadDataWithItems:(NSArray *)items;`
- 这只是个demo，并未经过实践的考验！

[原文地址](https://www.objc.io/issues/1-view-controllers/lighter-view-controllers/)
