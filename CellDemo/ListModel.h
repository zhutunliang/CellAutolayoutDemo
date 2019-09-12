//
//  ListModel.h
//  CellDemo
//
//  Created by nemo on 2019/9/11.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject <YYModel>
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *imageName;
@end

NS_ASSUME_NONNULL_END
