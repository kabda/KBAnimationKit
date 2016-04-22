//
//  KBAnimationsTableViewController.m
//  KBAnimationKit
//
//  Created by 樊远东 on 4/22/16.
//  Copyright © 2016 樊远东. All rights reserved.
//

#import "KBAnimationsTableViewController.h"
#import "KBTestAnimationViewController.h"

@interface KBAnimationsTableViewController ()
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSArray *selectedIndexPaths;
@end

@implementation KBAnimationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *startItem = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(start)];
    self.navigationItem.rightBarButtonItem = startItem;

    self.tableView.rowHeight = 56.0;

    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:0 inSection:1];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:0 inSection:2];
    self.selectedIndexPaths = @[indexPath0, indexPath1, indexPath2];

    self.data = @{@"Mode":@[@"Linear",
                                 @"Quadratic",
                                 @"Cubic",
                                 @"Quartic",
                                 @"Quintic",
                                 @"Sinusoidal",
                                 @"Exponential",
                                 @"Circular",
                                 @"Elastic",
                                 @"Back",
                                 @"Bounce"],
                  @"Sytle":@[@"EaseIn",
                             @"EaseOut",
                             @"EaseInOut"],
                  @"Animation":@[@"Transform",
                                 @"Rotation",
                                 @"Scale",
                                 @"Fade"]};
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Start
- (void)start {
    NSIndexPath *indexPath0 = (NSIndexPath *)self.selectedIndexPaths[0];
    NSIndexPath *indexPath1 = (NSIndexPath *)self.selectedIndexPaths[1];
    NSIndexPath *indexPath2 = (NSIndexPath *)self.selectedIndexPaths[2];

    KBAnimationOptions options = [KBAnimationsTableViewController optionsForIndexPath:indexPath0];
    options = options | [KBAnimationsTableViewController optionsForIndexPath:indexPath1];
    options = options | [KBAnimationsTableViewController optionsForIndexPath:indexPath2];

    KBTestAnimationViewController *testAnimationViewController = [[KBTestAnimationViewController alloc] init];
    testAnimationViewController.options = options;
    [self.navigationController pushViewController:testAnimationViewController animated:YES];
}

+ (KBAnimationOptions)optionsForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {
                return KBAnimationOptionsEaseIn;
            }
            case 1: {
                return KBAnimationOptionsEaseOut;
            }
            case 2: {
                return KBAnimationOptionsEaseInOut;
            }
            default:
                return -1;;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0: {
                return KBAnimationOptionsLinear;
            }
            case 1: {
                return KBAnimationOptionsQuadratic;
            }
            case 2: {
                return KBAnimationOptionsCubic;
            }
            case 3: {
                return KBAnimationOptionsQuartic;
            }
            case 4: {
                return KBAnimationOptionsQuintic;
            }
            case 5: {
                return KBAnimationOptionsSinusoidal;
            }
            case 6: {
                return KBAnimationOptionsExponential;
            }
            case 7: {
                return KBAnimationOptionsCircular;
            }
            case 8: {
                return KBAnimationOptionsElastic;
            }
            case 9: {
                return KBAnimationOptionsBack;
            }
            case 10: {
                return KBAnimationOptionsBounce;
            }
            default:
                return -1;;
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0: {
                return KBAnimationOptionsTransform;
            }
            case 1: {
                return KBAnimationOptionsRotation;
            }
            case 2: {
                return KBAnimationOptionsScale;
            }
            case 3: {
                return KBAnimationOptionsFade;
            }
            default:
                return -1;;
        }
    }
    return -1;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = (NSString *)self.data.allKeys[section];
    NSArray *items = (NSArray *)self.data[key];
    return items.count;
}

static NSString * const kCellReuseIdentifier = @"kCellReuseIdentifier";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *key = (NSString *)self.data.allKeys[indexPath.section];
    NSArray *items = (NSArray *)self.data[key];
    NSString *item = (NSString *)items[indexPath.row];
    cell.textLabel.text = item;

    NSIndexPath *selectedIndexPath = self.selectedIndexPaths[indexPath.section];
    cell.accessoryType = (indexPath.row == selectedIndexPath.row) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;

    return cell;
}

#pragma mark - UITableViewDelegte
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (NSString *)self.data.allKeys[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *tmpSelectedIndexPaths = [NSMutableArray arrayWithArray:self.selectedIndexPaths];
    [tmpSelectedIndexPaths replaceObjectAtIndex:indexPath.section withObject:indexPath];
    self.selectedIndexPaths = [tmpSelectedIndexPaths copy];
    [tableView reloadData];
}

@end
