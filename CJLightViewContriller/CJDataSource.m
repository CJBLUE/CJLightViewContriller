//
//  CJDataSource.m
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import "CJDataSource.h"

@implementation CJDataSource

#pragma mark 初始化
- (instancetype)initWithDataArr:(NSArray *)arr
                 withIdentifier:(NSString *)identifier
                      cellClass:(NSString *)cellClass
{
    self.dataArr = [NSArray arrayWithArray:arr];
    self.identifier = identifier;
    self.cellCalass = cellClass;
    return self;
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if (!cell) {
        // 用传进来的类 创建cell
        cell = [[NSClassFromString(self.cellCalass) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifier];
    }
    // cell回调
    if (self.rBlock) {
        self.rBlock(cell, self.dataArr[indexPath.row]);
    }
    return cell;
}

#pragma mark tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", self.dataArr[indexPath.row]);
    // 点击回调
    if (self.rClickBlock) {
        self.rClickBlock(self.dataArr[indexPath.row]);
    }
}

@end
