//
//  SPHomeViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPHomeViewController.h"

@interface SPHomeViewController ()

@end

@implementation SPHomeViewController

@synthesize skinCreationButton;
@synthesize skinEnrichmentButton;
@synthesize skinInformationButton;
@synthesize skinCreationViewController;
@synthesize skinEnrichmentViewController;

- (id)init
{
    self = [super init];
    if (self) {
        [self setSkinCreationViewController:[[SPSkinCreationViewController alloc] init]];
        [self setSkinEnrichmentViewController:[[SPSkinEnrichmentViewController alloc] init]];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    CGRect frame = [[self view] frame];
    
    CGRect skinCreationButtonFrame = CGRectMake(0, 0, frame.size.width, frame.size.height / 2);
    [self setSkinCreationButton:[[UIButton alloc] initWithFrame:skinCreationButtonFrame]];
    [[self skinCreationButton] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[self skinCreationButton] setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [[[self skinCreationButton] titleLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30.0]];
    [[self skinCreationButton] addTarget:self
                                  action:@selector(skinCreationButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
    [[self skinCreationButton] setTitle:[[[self skinCreationViewController] title] uppercaseString] forState:UIControlStateNormal];
    [[self view] addSubview:[self skinCreationButton]];
    
    CGRect skinEnrichmentButtonFrame = CGRectMake(0, frame.size.height / 2, frame.size.width, frame.size.height / 2);
    [self setSkinEnrichmentButton:[[UIButton alloc] initWithFrame:skinEnrichmentButtonFrame]];
    [[self skinEnrichmentButton] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[self skinEnrichmentButton] setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [[[self skinEnrichmentButton] titleLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30.0]];
    [[self skinEnrichmentButton] setTitle:[[[self skinEnrichmentViewController] title] uppercaseString] forState:UIControlStateNormal];
    [[self view] addSubview:[self skinEnrichmentButton]];
    [[self skinEnrichmentButton] addTarget:self
                                  action:@selector(skinEnrichmentButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)skinCreationButtonClicked
{
    [[self navigationController] pushViewController:[self skinCreationViewController] animated:YES];
}

- (void)skinEnrichmentButtonClicked
{

}

@end
