//
//  SPSkinService.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPHttpClient.h"
#import "SPSkinService.h"

static SPSkinService *sharedInstance = nil;

@implementation SPSkinService

+ (SPSkinService*)sharedInstance
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}

- (void)addSkin:(SPSkin*)skin succeeded:(void(^)(SPSkin *skin))success failed: (void (^)(NSError *error))failure {
//    [[SPHttpClient sharedInstance] POST:@"skins" parameters:[skin toDictionary] success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@", responseObject);
//        success([SPSkin initWithDictionary:responseObject]);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@", error);
//        failure(error);
//    }];
    [skin setToken:@"Mon nouveau token"];
    success(skin);
}

@end
