//
//  SPSkin.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPImageProperty.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SPSkin : NSObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSMutableArray *properties;
@property (strong, nonatomic) NSDictionary *links;

+ (SPSkin*)initWithDictionary:(NSDictionary*)dictionary;
+ (NSArray*)initWithArray:(NSArray*)array;
- (SPImageProperty*)firstImageProperty;

@end
