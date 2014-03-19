//
//  MUser.h
//  AFNetworkingDemo
//
//  Created by renren on 14-3-18.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kUserProfileImageDidLoadNotification;

@interface MUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatarImageURLString;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, strong) NSURL *avatarImageURL;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
