//
//  CJViewController.m
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import "CJViewController.h"
#import "CJDataSource.h"
#import "CJTableViewCell2.h"

static NSString *const reuse = @"reuse";

@interface CJViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CJDataSource *dataSource;

@end

@implementation CJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // cell回调
    self.dataSource.rBlock = ^(id cell, id data){
        // cell赋值方法
        [cell setCellData:data];
    };
    // 点击事件回调
    __weak typeof(self) weakSelf = self;
    self.dataSource.rClickBlock = ^(id data){
        NSLog(@"点击CJViewController的cell");
        // 点击返回上一页面
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
}

#pragma mark 加载dataSource
- (CJDataSource *)dataSource
{
    if (!_dataSource) {
        // 这里的数组应该是请求下来的数组，这里就简写了
        _dataSource = [[CJDataSource alloc] initWithDataArr:@[@"1", @"2", @"3"] withIdentifier:reuse cellClass:@"CJTableViewCell2"];
    }
    return _dataSource;
}

#pragma mark 加载tableview
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self.dataSource;
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
