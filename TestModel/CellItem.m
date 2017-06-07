//
//  CellItem.m
//  TestModel
//
//  Created by dulj on 17/6/6.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import "CellItem.h"
#import "MJExtension.h"
#import "ProductItem.h"

@implementation CellItem

MJExtensionCodingImplementation

+(void)load
{
#pragma mark 声明CellItem类中的items数组中存放的是ProductItem模型
    [CellItem mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"items" : @"ProductItem" // @"statuses" : [MJStatus class],
                 };
    }];
#pragma mark CellItem的模型转化完之后的容错处理处理
    [CellItem mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
        if ([property.name isEqualToString:@"titleItem"]) {
            if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]]) return [ProductItem new];
        } else if ([property.name isEqualToString:@"items"]) {
            if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]])
            {
                return [NSMutableArray arrayWithCapacity:0];
            }
        }
        return oldValue;
    }];
}

@end
