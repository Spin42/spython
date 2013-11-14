//
//  SPSkin.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SPSkin : NSObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSMutableDictionary *properties;

+ (SPSkin*)initWithDictionary:(NSDictionary*)dictionary;
+ (NSArray*)initWithArray:(NSArray*)array;

@end
