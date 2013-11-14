//
//  SPSkin.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPProperty.h"
#import "SPTextProperty.h"
#import "SPImageProperty.h"
#import "SPNumberProperty.h"
#import "SPLocationProperty.h"

@implementation SPSkin

@synthesize token;
@synthesize properties;
@synthesize links;

+ (SPSkin*)initWithDictionary:(NSDictionary*)dictionary
{
    SPSkin* skin = [[SPSkin alloc] init];
    [skin setToken:[dictionary objectForKey:@"token"]];
    [skin setLinks:[dictionary objectForKey:@"_links"]];
    [skin initializeProperties:[dictionary objectForKey:@"properties"]];
    
    return skin;
}

+ (NSArray*)initWithArray:(NSArray*)array
{
    NSMutableArray *skins = [[NSMutableArray alloc] init];
    
    for (NSDictionary *skinDictionary in array)
        [skins addObject:[SPSkin initWithDictionary:skinDictionary]];
    
    return skins;
}

- (void)initializeProperties:(NSArray*)_properties
{
    [self setProperties:[[NSMutableArray alloc] init]];
    for (NSDictionary *propertyDictionary in _properties) {
        SPProperty *property;
        NSString *type = [propertyDictionary objectForKey:@"type"];
        if ([type isEqualToString:@"Test"])
            property = [[SPTextProperty alloc] initWithDictionary:propertyDictionary];
        else if ([type isEqualToString:@"Image"])
            property = [[SPImageProperty alloc] initWithDictionary:propertyDictionary];
        else if ([type isEqualToString:@"Location"])
            property = [[SPLocationProperty alloc] initWithDictionary:propertyDictionary];
        else if ([type isEqualToString:@"Number"])
            property = [[SPNumberProperty alloc] initWithDictionary:propertyDictionary];
        
        [[self properties] addObject:property];
    }
}

- (SPImageProperty*)firstImageProperty
{
    for (SPProperty* property in [self properties]) {
        if ([property isKindOfClass:[SPImageProperty class]])
            return (SPImageProperty*)property;
    }
    return nil;
}
@end
