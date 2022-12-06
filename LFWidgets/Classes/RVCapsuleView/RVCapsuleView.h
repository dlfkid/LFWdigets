//
//  RVCapsuleView.h
//  LFWidgets
//
//  Created by ravendeng on 2022/12/5.
//

#import <UIKit/UIKit.h>
#import "RVCapsuleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RVCapsuleView : UIView

- (void)bindViewModel:(RVCapsuleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
