//
//  RVCapsuleViewModel.h
//  LFWidgets
//
//  Created by ravendeng on 2022/12/6.
//

#import <Foundation/Foundation.h>
#import "RVCapsuleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RVCapsuleViewModel : NSObject

@property (nonatomic, weak) UIView *CapsuleViewl;

@property (nonatomic, strong) NSArray<RVCapsuleCellModel *> *cellModels;

/// 设置每个Cell之间的水平间距
@property (nonatomic, assign) CGFloat cellHorizonalMargin;

/// 设置每个Cell之间的垂直间距, 可以用这个属性决定Cell的行数, 默认0
@property (nonatomic, assign) CGFloat cellVerticalMargin;

@end

NS_ASSUME_NONNULL_END
