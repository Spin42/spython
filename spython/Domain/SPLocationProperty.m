//
//  SPLocationProperty.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPLocationProperty.h"
#import <CoreLocation/CoreLocation.h>

@implementation SPLocationProperty

- (id)init
{
    self = [super init];
    if (self) {
        [self setType:@"Location"];
    }
    return self;
}

- (id)initWithKey:(NSString*)_key location:(CLLocation*)_value
{
    self = [self init];
    if (self) {
        [self setKey:_key];
        [self setValue:[NSString stringWithFormat:@"%f;%f", [_value coordinate].latitude, [_value coordinate].longitude]];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self setKey:[dictionary objectForKey:@"key"]];
        [self setValue:[dictionary objectForKey:@"value"]];
        NSArray *coordinates = [[self value] componentsSeparatedByString:@";"];
        [self setDecodedValue:[[CLLocation alloc] initWithLatitude:[[coordinates objectAtIndex:0] doubleValue]
                                                         longitude:[[coordinates objectAtIndex:1] doubleValue]]];
    }
    return self;
}

@end
