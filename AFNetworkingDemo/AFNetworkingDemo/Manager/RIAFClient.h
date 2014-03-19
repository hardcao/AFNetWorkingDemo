//
//  RIAFClient.h
//  AFNetworkingDemo
//
//  Created by renren on 14-3-18.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef void(^RISuccessBlock)(id object);
typedef void(^RIFailedBlock)(NSString *errorMessage);
#define RICallBlockSafely(block, ...) \
    if (block) \
        block(__VA_ARGS__)

@interface RIAFClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getAFNetWorkingTestDataWithSuccessBlock:(RISuccessBlock)successBlock
                                    failedBlock:(RIFailedBlock)failedBlock;

@end

