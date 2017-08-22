//
//  ViewController.m
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import "ViewController.h"
#import "CJDataSource.h"
#import "CJTableViewCell.h"
#import "CJViewController.h"

static NSString *const reuse = @"reuse";

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CJDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    // cell回调
    self.dataSource.rBlock = ^(id cell, id data){
        // cell赋值方法
        [cell setCellData:data];
    };
    // 点击事件回调
    __weak typeof(self) wakSelf = self;
    self.dataSource.rClickBlock = ^(id data){
        // 跳转到另一个控制器，用同样的方式创建一个tableview，换一个自定义的cell--CJTableViewCell2，验证是否能重用DataSource
        CJViewController *VC = [CJViewController new];
        [wakSelf presentViewController:VC animated:YES completion:nil];
    };
}

#pragma mark 加载dataSource
- (CJDataSource *)dataSource
{
    if (!_dataSource) {
        // 这里的数组应该是请求下来的数组，这里就简写了
        _dataSource = [[CJDataSource alloc] initWithDataArr:@[@"1", @"2", @"3"] withIdentifier:reuse cellClass:@"CJTableViewCell"];
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


@end
