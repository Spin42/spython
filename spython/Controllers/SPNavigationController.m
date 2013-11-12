//
//  SPNavigationController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPNavigationController.h"

@interface SPNavigationController ()

@end

@implementation SPNavigationController

@synthesize homeViewController;

- (id)init
{
    self = [super init];
    if (self) {
        [[self navigationBar] setTranslucent:NO];
        [self setHomeViewController:[[SPHomeViewController alloc] init]];
        [self addChildViewController:[self homeViewController]];
    }
    return self;
}


@end
