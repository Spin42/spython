//
//  SPNumberProperty.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPNumberProperty.h"

@implementation SPNumberProperty

- (id)init
{
    self = [super init];
    if (self) {
        [self setType:@"Number"];
    }
    return self;
}

- (id)initWithKey:(NSString*)_key number:(NSNumber*)_value
{
    self = [self init];
    if (self) {
        [self setKey:_key];
        [self setValue:[_value stringValue]];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self setKey:[dictionary objectForKey:@"key"]];
        [self setValue:[dictionary objectForKey:@"value"]];
        [self setDecodedValue:[NSNumber numberWithInt:[[self value] intValue]]];
    }
    return self;
}
@end
