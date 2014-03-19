//
//  RITableViewCell.m
//  AFNetworkingDemo
//
//  Created by renren on 14-3-19.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import "RITableViewCell.h"

@implementation RITableViewCell

- (void)initCellWithUser:(MUser *)user
{
    self.userDescription.text = user.userDescription;
    self.userImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:user.avatarImageURL]];
}

@end
