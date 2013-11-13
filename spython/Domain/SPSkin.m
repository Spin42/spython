//
//  SPSkin.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"

@implementation SPSkin

@synthesize location;
@synthesize picture;
@synthesize token;

+ (SPSkin*)initWithDictionary:(NSDictionary*)dictionary
{
    SPSkin* skin = [[SPSkin alloc] init];
    // Load from dictionnary
    return skin;
}

- (NSDictionary*)toDictionary
{
    return [[NSDictionary alloc] initWithObjectsAndKeys:nil];
}

@end
