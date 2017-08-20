//
//  CJDataSource.h
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 返回cell和数据，这里数据类型看数组里装的是什么类型，这里是NSString
typedef void(^returnCell)(id cell, NSString *data);
// 返回点击cell的数据，类型同上，不需要数据就不写返回值
typedef void(^returnClick)(NSString *data);

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
