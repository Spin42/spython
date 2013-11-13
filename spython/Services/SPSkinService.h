//
//  SPSkinService.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPSkinService : NSObject

+ (SPSkinService*)sharedInstance;
- (void)addSkin:(SPSkin*)skin succeeded:(void(^)(SPSkin *skin))success failed: (void (^)(NSError *error))failure;

@end
