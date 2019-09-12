//
//  ListTableViewCell.h
//  CellDemo
//
//  Created by nemo on 2019/9/11.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell

- (void)configModel:(ListModel *)model;

@end

NS_ASSUME_NONNULL_END
