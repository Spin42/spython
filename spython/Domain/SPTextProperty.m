//
//  SPTextProperty.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPTextProperty.h"

@implementation SPTextProperty

@synthesize decodedValue;

- (id)init
{
    self = [super init];
    if (self) {
        [self setType:@"Text"];
    }
    return self;
}

- (id)initWithKey:(NSString*)_key text:(NSString*)_value
{
    self = [self init];
    if (self) {
        [self setKey:_key];
        [self setValue:_value];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        [self setKey:[dictionary objectForKey:@"key"]];
        [self setValue:[dictionary objectForKey:@"value"]];
        [self setDecodedValue:[self value]];
    }
    return self;
}

@end
