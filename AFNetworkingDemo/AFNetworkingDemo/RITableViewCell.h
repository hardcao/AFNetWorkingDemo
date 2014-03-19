//
//  RITableViewCell.h
//  AFNetworkingDemo
//
//  Created by renren on 14-3-19.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUser.h"

@interface RITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (nonatomic, weak) IBOutlet UILabel *userDescription;

- (void)initCellWithUser:(MUser *)user;

@end
