//
//  LFCapsuleView.m
//  LFWidgets
//
//  Created by ravendeng on 2022/12/5.
//

#import "LFCapsuleView.h"
#import "LFCapsuleCell.h"

static NSString *const kRVCapsuleViewReuseIdentifier = @"kRVCapsuleViewReuseIdentifier";
static NSInteger const kRVCapsuleViewCellTag = 1024;

@interface LFCapsuleView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) LFCapsuleViewModel *viewModel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LFCapsuleView

#pragma mark - Private

- (void)configCollectionView {
    [self addSubview:self.collectionView];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 10;

    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kRVCapsuleViewReuseIdentifier];
    [self addSubview:self.collectionView];
}

#pragma mark - Public

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)bindViewModel:(LFCapsuleViewModel *)viewModel {
    self.viewModel = viewModel;
}

#pragma mark - UIColectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger count = self.viewModel.cellModels.count;
    return count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kRVCapsuleViewReuseIdentifier forIndexPath:indexPath];
    LFCapsuleCell *cellView = [cell.contentView viewWithTag:kRVCapsuleViewCellTag];
    if (!cellView) {
        cellView = [[LFCapsuleCell alloc] initWithFrame:cell.contentView.bounds];
        [cell.contentView addSubview:cellView];
    }
    LFCapsuleCellModel *cellModel = self.viewModel.cellModels[indexPath.item];
    [cellView bindCellModel:cellModel];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFCapsuleCellModel *model = self.viewModel.cellModels[indexPath.item];
    CGFloat leftMargin = 0;
    CGFloat rightMargin = 0;
    if (model.leftIconImage) {
        leftMargin = model.leftIconMargin + model.leftIconSize.width;
    }
    if (model.rightIconImage) {
        rightMargin = model.rightIconMargin + model.rightIconSize.width;
    }
    return CGSizeMake(model.titleWidth + model.radius * 2 + leftMargin + rightMargin, model.cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(self.viewModel.cellVerticalMargin, self.viewModel.cellHorizonalMargin, self.viewModel.cellVerticalMargin,
                            self.viewModel.cellHorizonalMargin);
}

@end
