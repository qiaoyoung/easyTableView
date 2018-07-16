# easyTableView

### 使用方法：
``` 
    static NSString *cellIdentifier = @"cellId";
    self.sourceModelObj = [[QYTableViewDataSource alloc] initWithItems:arr cellIdentifier:cellIdentifier configureCellBlock:^(id cell, id item) {
        // refresh cell
        [cell refreshCellWithModel:item];
    }];
    self.tableView.dataSource = self.sourceModelObj;
    [self.tableView registerClass:[<#CellName#> class] forCellReuseIdentifier:cellIdentifier];
```
-  分离了controller中UITableViewDataSource的实现，将其放在了*QYTableViewDataSource*类中；好处：1.复用；2.瘦身controller.
- 
