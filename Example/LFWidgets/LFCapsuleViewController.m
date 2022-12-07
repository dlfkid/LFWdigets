//
//  LFCapsuleViewController.m
//  LFWidgets_Example
//
//  Created by ravendeng on 2022/12/5.
//  Copyright © 2022 ravendeng. All rights reserved.
//

#import "LFCapsuleViewController.h"
#import "LFCapsuleView.h"

@interface LFCapsuleViewController ()

@property (nonatomic, strong) LFCapsuleView *capsuleView;
@property (nonatomic, strong) LFCapsuleViewModel *capsuleViewModel;

@end

@implementation LFCapsuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LFCapsuleViewExample";
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat capsuleViewHeight = 55;
    CGFloat topMargin = 100;
    self.capsuleView = [[LFCapsuleView alloc] initWithFrame:CGRectMake(0, topMargin, screenWidth, capsuleViewHeight)];
    self.capsuleView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.capsuleView];
    [self.capsuleView bindViewModel:self.capsuleViewModel];
}

- (LFCapsuleViewModel *)capsuleViewModel {
    if (!_capsuleViewModel) {
        _capsuleViewModel = [[LFCapsuleViewModel alloc] init];
    }
    return _capsuleViewModel;
}

@end
