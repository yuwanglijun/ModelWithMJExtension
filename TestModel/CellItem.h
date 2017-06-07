//
//  CellItem.h
//  TestModel
//
//  Created by dulj on 17/6/6.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductItem.h"

@interface CellItem : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) ProductItem *titleItem;

@property (nonatomic, strong) NSMutableArray *items;//数组中存放的是ProductItem类型

@end
