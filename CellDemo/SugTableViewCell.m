//
//  SugTableViewCell.m
//  CellDemo
//
//  Created by nemo on 2019/9/12.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "SugTableViewCell.h"
#import <Masonry.h>

@interface SugTableViewCell ()
@property (nonatomic ,strong) UILabel *kLabel;
@property (nonatomic ,strong) UILabel *vLabel;
@end

@implementation SugTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    UILabel *kLabel = [UILabel new];
    _kLabel = kLabel;
    [self.contentView addSubview:kLabel];
    kLabel.font = [UIFont systemFontOfSize:15];
    kLabel.textColor = [UIColor lightGrayColor];
#pragma mark -UILayoutPriorityRequired 布局优先级高，优先显示 kLabel . 不设置的话，则优先显示 vLabel
    [kLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    UILabel *vLabel = [UILabel new];
    _vLabel = vLabel;
    [self.contentView addSubview:vLabel];
    vLabel.font = [UIFont systemFontOfSize:15];
    vLabel.textColor = [UIColor orangeColor];
    
    
    [kLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.bottom.equalTo(self.contentView);
    }];
    
    [vLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(kLabel.mas_right).offset(10);
    }];
    
}

- (void)configCell:(ListSugModel *)model {
    self.kLabel.text = model.k;
    self.vLabel.text = model.v;
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
