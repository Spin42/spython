//
//  SPSkinService.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <Foundation/Foundation.h>

@interface SPSkinService : NSObject

+ (SPSkinService*)sharedInstance;
- (void)create:(NSArray*)properties succeeded:(void(^)(NSDictionary *resource))success failed: (void (^)(NSError *error))failure;
- (void)getAll:(void(^)(NSDictionary *skinsResource))success failed: (void (^)(NSError *error))failure;
- (void)get:(NSString*)url succeeded:(void(^)(SPSkin *skin))success failed: (void (^)(NSError *error))failure;

@end
