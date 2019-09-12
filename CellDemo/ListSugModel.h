//
//  ListSugModel.h
//  CellDemo
//
//  Created by nemo on 2019/9/12.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

NS_ASSUME_NONNULL_BEGIN


@interface ListSugModel : NSObject <YYModel>
@property (nonatomic ,copy) NSString *k;
@property (nonatomic ,copy) NSString *v;

@end

NS_ASSUME_NONNULL_END
