//
//  SPHttpClient.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SPHttpClient : AFHTTPSessionManager

+ (SPHttpClient *)sharedInstance;

@end
