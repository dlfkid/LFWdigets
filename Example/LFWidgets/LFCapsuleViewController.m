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

    self.capsuleViewModel.cellVerticalMargin = 5;
    self.capsuleViewModel.cellHorizonalMargin = 5;

    NSArray *testData = @[ @"alpha", @"beta", @"gamma", @"epsilon", @"zeta", @"eta", @"theta", @"iota", @"kappa" ];

    NSMutableArray *cellModels = [[NSMutableArray alloc] init];

    for (NSString *text in testData) {
        LFCapsuleCellModel *cellModel = [self sampleCellModel];
        cellModel.title = text;
        [cellModels addObject:cellModel];
    }

    self.capsuleViewModel.cellModels = cellModels;

    [self.capsuleView bindViewModel:self.capsuleViewModel];
}

- (LFCapsuleCellModel *)sampleCellModel {
    LFCapsuleCellModel *cellModel = [[LFCapsuleCellModel alloc] init];
    cellModel.maxWidth = 110;
    cellModel.cellHeight = 24;
    cellModel.radius = cellModel.cellHeight / 2;
    cellModel.backgroundColor = [UIColor lightGrayColor];
    cellModel.font = [UIFont boldSystemFontOfSize:16];
    cellModel.longPressGestrueHandler = ^(UIGestureRecognizer *_Nonnull gesture, LFCapsuleCellModel *_Nonnull model) {
        NSLog(@"long press: %@", model.title);
    };
    cellModel.tapGestrureHandler = ^(UIGestureRecognizer *_Nonnull gesture, LFCapsuleCellModel *_Nonnull model) {
        NSLog(@"tap: %@", model.title);
    };
    return cellModel;
}

- (LFCapsuleViewModel *)capsuleViewModel {
    if (!_capsuleViewModel) {
        _capsuleViewModel = [[LFCapsuleViewModel alloc] init];
    }
    return _capsuleViewModel;
}

@end
