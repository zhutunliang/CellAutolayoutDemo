//
//  ListTableViewCell.m
//  CellDemo
//
//  Created by nemo on 2019/9/11.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "ListTableViewCell.h"
#import <Masonry.h>

@interface ListTableViewCell ()
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIImageView *customImageView;
@property (nonatomic ,strong) UILabel *nameLabel;
@end

@implementation ListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    UILabel *titleLabel = [UILabel new];
    _titleLabel = titleLabel;
    [self.contentView addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor blueColor];
    
    UILabel *textLabel = [UILabel new];
    _contentLabel = textLabel;
    [self.contentView addSubview:textLabel];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.numberOfLines = 0;
    
    UIImageView *imageView = [UIImageView new];
    _customImageView = imageView;
    [self.contentView addSubview:imageView];
    [imageView sizeToFit];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *nameLabel = [UILabel new];
    _nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor lightGrayColor];
    
    UIView *bottomLine = [UIView new];
    [self.contentView addSubview:bottomLine];
    bottomLine.backgroundColor = [UIColor greenColor];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(10);
    }];

    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleLabel);
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(textLabel.mas_bottom).offset(10);

    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-20);
    }];

    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleLabel);
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(19);
        make.height.mas_equalTo(1);
    }];
}

- (void)configModel:(ListModel *)model {
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.customImageView.image = [UIImage imageNamed:model.imageName];
    self.nameLabel.text = model.username;
}


@end
