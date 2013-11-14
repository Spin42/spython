//
//  SPHttpClient.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPHttpClient.h"

@implementation SPHttpClient

+ (SPHttpClient *)sharedInstance
{
    static SPHttpClient *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *serverURL = [NSURL URLWithString:@"http://spython.herokuapp.com"];
        sharedInstance = [[SPHttpClient alloc] initWithBaseURL:serverURL];
        [sharedInstance setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [sharedInstance setRequestSerializer:[AFJSONRequestSerializer serializer]];
    });
    return sharedInstance;
}

@end
