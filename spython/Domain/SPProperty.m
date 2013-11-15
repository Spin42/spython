//
//  SPProperty.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPProperty.h"

@implementation SPProperty

@synthesize key;
@synthesize value;
@synthesize type;
@synthesize unit;
@synthesize logoUrl;

-(NSDictionary*)toDictionary
{
    return [[NSDictionary alloc] initWithObjectsAndKeys:
            [self key], @"key",
            [self type], @"type",
            [self value], @"value",
            [self unit], @"unit",
            nil];
}

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self setUnit:[dictionary objectForKey:@"unit"]];
        [self setLogoUrl:[dictionary objectForKey:@"logo_url"]];
        [self setDate:[NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"timestamp"] doubleValue]]];
    }
    return self;
}

@end
