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
@synthesize activityIndicatorView;
@synthesize activityIndicatorViewCount;

- (id)init
{
    self = [super init];
    if (self) {
        [[self navigationBar] setTranslucent:NO];
        [[self navigationBar] setBackgroundImage:[UIImage imageNamed:@"topBarBackground.png"]
                                   forBarMetrics:UIBarMetricsDefault];
        [[self navigationBar] setTintColor:[UIColor whiteColor]];
        [self setHomeViewController:[[SPHomeViewController alloc] init]];
        [self pushViewController:[self homeViewController] animated:NO];
        
        [self setActivityIndicatorViewCount:0];
        [self setActivityIndicatorView:[[UIView alloc] initWithFrame:[[self view] frame]]];
        
        [[self activityIndicatorView] setBackgroundColor:[UIColor clearColor]];
        
        UIView *activityIndicatorBoxView = [[UIView alloc] initWithFrame:CGRectMake(75,
                                                                                    ([[self view] frame].size.height / 2) - 40,
                                                                                    [[self view] frame].size.width - 150,
                                                                                    80)];
        [activityIndicatorBoxView setBackgroundColor:[UIColor blackColor]];
        [activityIndicatorBoxView setAlpha:0.9];
        [[activityIndicatorBoxView layer] setCornerRadius:5.0];
        [[self activityIndicatorView] addSubview:activityIndicatorBoxView];
        
        UIActivityIndicatorView *activityIndicatorInnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activityIndicatorInnerView setFrame:[[self view] frame]];
        [activityIndicatorInnerView startAnimating];
        [[self activityIndicatorView] addSubview:activityIndicatorInnerView];
    }
    return self;
}

- (void)showActivityIndicator
{
    if (![[[self view] subviews] containsObject:[self activityIndicatorView]])
        [[self view] addSubview:[self activityIndicatorView]];
    [self setActivityIndicatorViewCount:[self activityIndicatorViewCount] + 1];
    [[self view] bringSubviewToFront:[self activityIndicatorView]];
}

- (void)hideActivityIndicator
{
    if ([self activityIndicatorViewCount] > 0)
        [self setActivityIndicatorViewCount:[self activityIndicatorViewCount] - 1];
    if ([self activityIndicatorViewCount] == 0 && [[[self view] subviews] containsObject:[self activityIndicatorView]])
        [[self activityIndicatorView] removeFromSuperview];
}

@end
