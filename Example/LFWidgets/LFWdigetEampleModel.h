//
//  LFWdigetEampleModel.h
//  LFWidgets_Example
//
//  Created by ravendeng on 2022/12/5.
//  Copyright © 2022 ravendeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFWdigetEampleModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) dispatch_block_t tapHandler;

- (instancetype)initWithName:(NSString *)name tapHandler:(dispatch_block_t)tapHandler;

@end

NS_ASSUME_NONNULL_END
