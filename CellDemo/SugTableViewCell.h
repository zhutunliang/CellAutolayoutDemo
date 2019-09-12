//
//  SugTableViewCell.h
//  CellDemo
//
//  Created by nemo on 2019/9/12.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListSugModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SugTableViewCell : UITableViewCell

- (void)configCell:(ListSugModel *)model;

@end

NS_ASSUME_NONNULL_END
