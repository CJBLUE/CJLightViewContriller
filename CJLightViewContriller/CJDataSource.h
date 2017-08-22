//
//  CJDataSource.h
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 返回cell和数据
typedef void(^returnCell)(id cell, id data);
// 返回点击cell的数据
typedef void(^returnClick)(id data);

@interface CJDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>
// 返回cell
@property (nonatomic, copy)returnCell rBlock;
// 返回click
@property (nonatomic, copy)returnClick rClickBlock;
// cell重用标识
@property (nonatomic, strong) NSString *identifier;
// 数据源
@property (nonatomic, strong) NSArray *dataArr;
// cell的类名
@property (nonatomic, strong) NSString *cellCalass;
// 初始化方法
- (instancetype)initWithDataArr:(NSArray *)arr
                 withIdentifier:(NSString *)identifier
                      cellClass:(NSString *)cellClass;

@end
