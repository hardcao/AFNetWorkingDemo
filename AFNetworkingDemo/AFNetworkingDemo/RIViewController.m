//
//  RIViewController.m
//  AFNetworkingDemo
//
//  Created by renren on 14-3-18.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import "RIViewController.h"
#import "MUser.h"
#import "RIAFClient.h"
#import "RITableViewCell.h"

static NSString * const kDefaultTableCellID = @"TableViewCell";

@interface RIViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *userArray;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation RIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reloadData];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData
{
     __weak __typeof(&*self)weakSelf = self;
    [[RIAFClient sharedClient] getAFNetWorkingTestDataWithSuccessBlock:^(NSArray *result){
                                                            weakSelf.userArray = result;
                                                            [weakSelf.tableView reloadData];
                                                         } failedBlock:^(NSString *errorMessage) {
                                                             
                                                         }];
}

#pragma mark - tableviewDelegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id user = self.userArray[indexPath.row];
    RITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDefaultTableCellID];
    [cell initCellWithUser:user];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (IBAction)uploadDataButtonTap:(id)sender {
    [self reloadData];
}



@end
