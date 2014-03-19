//
//  MUser.m
//  AFNetworkingDemo
//
//  Created by renren on 14-3-18.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import "MUser.h"
#import "AFHTTPRequestOperation.h"
NSString * const kUserProfileImageDidLoadNotification = @"com.alamofire.user.profile-image.loaded";

@implementation MUser

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.userDescription = [attributes valueForKeyPath:@"text"];
    self.username = [self getUserNameWithAttributes:[attributes valueForKeyPath:@"user"]];
    self.avatarImageURLString = [self getAvatarImageURLStringWithAttributes:[attributes valueForKeyPath:@"user"]];
    self.avatarImageURL = [self avatarImageURL];
    return self;
}

- (NSURL *)avatarImageURL {
    return [NSURL URLWithString:self.avatarImageURLString];
}

- (NSString *)getAvatarImageURLStringWithAttributes:(NSArray *)attributes
{
    return [attributes valueForKeyPath:@"avatar_image.url"];
}

- (NSString *)getUserNameWithAttributes:(NSArray *)attributes
{
    return [attributes valueForKeyPath:@"username"];
}

@end
