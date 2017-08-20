//
//  CJTableViewCell2.m
//  CJLightViewContriller
//
//  Created by zxjk on 17/8/20.
//
//

#import "CJTableViewCell2.h"

@implementation CJTableViewCell2
{
    UILabel *left;
    UILabel *right;
}

#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

#pragma mark 创建视图
- (void)createView
{
    left = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2.0, self.frame.size.height)];
    [self addSubview:left];
    left.textAlignment = NSTextAlignmentRight;
    
    right = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0, 0, [UIScreen mainScreen].bounds.size.width/2.0, self.frame.size.height)];
    [self addSubview:right];
}

#pragma mark 赋值
- (void)setCellData:(NSString *)data
{
    left.text = [NSString stringWithFormat:@"left %@", data];
    right.text = [NSString stringWithFormat:@"right %@", data];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
