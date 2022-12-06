//
//  RVCapsuleCell.m
//  LFWidgets
//
//  Created by ravendeng on 2022/12/5.
//

#import "RVCapsuleCell.h"

@interface RVCapsuleCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIImageView *leftIcon;
@property (nonatomic, strong) UIImageView *rightIcon;
@property (nonatomic, strong) RVCapsuleCellModel *cellModel;

@end

@implementation RVCapsuleCell

#pragma mark - Overide

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureBaseUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureBaseUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configureBaseUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self relayoutSubViews];
}

#pragma mark - Private

- (void)configureBaseUI {
    _bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    _leftIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    _rightIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.bottomView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.leftIcon];
    [self addSubview:self.rightIcon];
}

- (void)relayoutSubViews {
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    CGFloat viewWidth = CGRectGetWidth(self.bounds);

    self.bottomView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
    self.bottomView.layer.cornerRadius = self.cellModel.radius;

    CGFloat leftMargin = self.cellModel.radius;
    // 布局左图标
    if (self.cellModel.leftIconImage) {
        CGFloat imageY = (viewHeight - self.cellModel.leftIconSize.height) / 2;
        self.leftIcon.frame = CGRectMake(self.cellModel.radius, imageY, self.cellModel.leftIconSize.width, self.cellModel.leftIconSize.height);
        leftMargin = self.cellModel.radius + self.cellModel.leftIconMargin + self.cellModel.leftIconSize.width;
    }
    // 布局Label
    self.titleLabel.frame = CGRectMake(leftMargin, 0, self.cellModel.titleWidth, viewHeight);
    // 布局右图标
    if (self.cellModel.rightIconImage) {
        CGFloat imageY = (viewHeight - self.cellModel.rightIconSize.height) / 2;
        CGFloat rightMargin = CGRectGetMaxX(self.titleLabel.frame) + self.cellModel.rightIconMargin;
        self.rightIcon.frame = CGRectMake(rightMargin, imageY, self.cellModel.rightIconSize.width, self.cellModel.rightIconSize.height);
    }
}

#pragma mark - Public

- (void)bindCellModel:(RVCapsuleCellModel *)cellModel {
    self.cellModel = cellModel;
    if (cellModel.attributeTitle.length > 0) {
        self.titleLabel.attributedText = cellModel.attributeTitle;
    } else {
        self.titleLabel.text = cellModel.title;
    }
    self.titleLabel.font = cellModel.font;
    self.titleLabel.textColor = cellModel.textColor;
    self.bottomView.backgroundColor = cellModel.backgroundColor;
    if (cellModel.leftIconImage) {
        self.leftIcon.image = cellModel.leftIconImage;
    }
    if (cellModel.rightIconImage) {
        self.rightIcon.image = cellModel.rightIconImage;
    }
    self.leftIcon.image = cellModel.leftIconImage;
    self.rightIcon.image = cellModel.rightIconImage;
}

@end
