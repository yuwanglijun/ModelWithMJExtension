//
//  ProductItem.m
//  TestModel
//
//  Created by dulj on 17/6/6.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import "ProductItem.h"
#import "MJExtension.h"

@implementation ProductItem

MJExtensionCodingImplementation

-(instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"";
        _price = @"";
    }
    return self;
}

@end
