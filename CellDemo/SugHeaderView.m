//
//  SugHeaderView.m
//  CellDemo
//
//  Created by nemo on 2019/9/12.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "SugHeaderView.h"
#import <Masonry.h>

@implementation SugHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    UILabel *bigLabel = [UILabel new];
    [self addSubview:bigLabel];
    bigLabel.font = [UIFont systemFontOfSize:20];
    bigLabel.textColor = [UIColor redColor];
    bigLabel.text = @"这是sug header";
    
    UILabel *smallLabel = [UILabel new];
    [self addSubview:smallLabel];
    smallLabel.font = [UIFont systemFontOfSize:16];
    smallLabel.textColor = [UIColor blackColor];
    smallLabel.numberOfLines = 0;
    smallLabel.text = @"协议声明了用于订阅事件的方法subscribe(_:)，这个方法接收了一个Observer作为参数，基于此方法我们就可以扩展出专门针对特殊事件类型（next、error）的订阅方法：";
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor redColor];
    
    [bigLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    [smallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bigLabel);
        make.top.mas_equalTo(bigLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bigLabel);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self);
    }];
}

@end
