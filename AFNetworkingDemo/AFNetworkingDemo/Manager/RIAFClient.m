//
//  RIAFClient.m
//  AFNetworkingDemo
//
//  Created by renren on 14-3-18.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import "RIAFClient.h"
#import "MUser.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"https://alpha-api.app.net/";

@implementation RIAFClient

+ (instancetype)sharedClient {
    static RIAFClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[RIAFClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
    });
    return sharedClient;
}

- (void)getAFNetWorkingTestDataWithSuccessBlock:(RISuccessBlock)successBlock
                                    failedBlock:(RIFailedBlock)failedBlock
{
    [[RIAFClient sharedClient] GET:@"stream/0/posts/stream/global" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
        NSMutableArray *mutableUser = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            MUser *mUser = [[MUser alloc] initWithAttributes:attributes];
            [mutableUser addObject:mUser];
        }
        RICallBlockSafely(successBlock, mutableUser);
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        RICallBlockSafely(failedBlock, error.description);
    }];
}

@end
