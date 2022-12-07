//
//  LFCapsuleView.h
//  LFWidgets
//
//  Created by ravendeng on 2022/12/5.
//

#import <UIKit/UIKit.h>
#import "LFCapsuleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFCapsuleView : UIView

- (void)bindViewModel:(LFCapsuleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
