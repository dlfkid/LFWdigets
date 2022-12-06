//
//  LFWdigetEampleModel.m
//  LFWidgets_Example
//
//  Created by ravendeng on 2022/12/5.
//  Copyright © 2022 ravendeng. All rights reserved.
//

#import "LFWdigetEampleModel.h"

@implementation LFWdigetEampleModel

- (instancetype)initWithName:(NSString *)name tapHandler:(dispatch_block_t)tapHandler {
    if (self = [super init]) {
        _name = name;
        _tapHandler = tapHandler;
    }
    return self;
}

@end
