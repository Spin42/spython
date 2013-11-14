//
//  SPImageProperty.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPImageProperty.h"

@implementation SPImageProperty

@synthesize decodedValue;

- (id)init
{
    self = [super init];
    if (self) {
        [self setType:@"Image"];
    }
    return self;
}

- (id)initWithKey:(NSString*)_key image:(UIImage*)_value
{
    self = [self init];
    if (self) {
        [self setKey:_key];
        NSData *imageData = UIImageJPEGRepresentation(_value, 0);
        [self setValue:[imageData base64EncodedStringWithOptions:0]];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        [self setKey:[dictionary objectForKey:@"key"]];
        [self setValue:[dictionary objectForKey:@"value"]];
        NSData *imageData = [[NSData alloc] initWithBase64EncodedString:[self value] options:0];
        [self setDecodedValue:[UIImage imageWithData:imageData]];
    }
    return self;
}

@end
