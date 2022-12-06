//
//  LFViewController.m
//  LFWidgets
//
//  Created by ravendeng on 12/05/2022.
//  Copyright (c) 2022 ravendeng. All rights reserved.
//

#import "LFViewController.h"
#import "LFWdigetEampleModel.h"
#import "LFCapsuleViewController.h"

static NSString *const kLFWidgetsExampleReuseIdentifier = @"kLFWidgetsExampleReuseIdentifier";

@interface LFViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<LFWdigetEampleModel *> *examples;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LFWidgetExamples";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kLFWidgetsExampleReuseIdentifier];
    [self.view addSubview:self.tableView];
}

- (NSArray<LFWdigetEampleModel *> *)examples {
    if (!_examples) {
        __weak typeof(self) weakSelf = self;
        _examples = @[
            [[LFWdigetEampleModel alloc] initWithName:@"LFCapsuleView"
                                           tapHandler:^{
                                               LFCapsuleViewController *capsuleExample = [[LFCapsuleViewController alloc] init];
                                               [weakSelf.navigationController pushViewController:capsuleExample animated:YES];
                                           }],
        ];
    }
    return _examples;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examples.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LFWdigetEampleModel *example = self.examples[indexPath.row];
    if (example.tapHandler) {
        example.tapHandler();
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLFWidgetsExampleReuseIdentifier forIndexPath:indexPath];
    LFWdigetEampleModel *model = self.examples[indexPath.row];
    cell.textLabel.text = model.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
