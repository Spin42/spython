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

- (void)create:(NSArray*)properties succeeded:(void(^)(NSDictionary *resource))success failed:(void (^)(NSError *error))failure {
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:properties, @"properties", nil];
    
    [[SPHttpClient sharedInstance] POST:@"api/skins"
                             parameters:[[NSDictionary alloc] initWithObjectsAndKeys:parameters, @"skin", nil]
                                success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        failure(error);
    }];
}

- (void)getAll:(void(^)(NSDictionary *skinsResource))success failed:(void (^)(NSError *error))failure {
    [[SPHttpClient sharedInstance] GET:@"api/skins"
                            parameters:nil
                               success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        failure(error);
    }];
}

- (void)get:(NSString*)url succeeded:(void(^)(SPSkin *skin))success failed:(void (^)(NSError *error))failure {
    [[SPHttpClient sharedInstance] GET:url
                            parameters:nil
                               success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        success([SPSkin initWithDictionary:responseObject]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        failure(error);
    }];
}
@end
