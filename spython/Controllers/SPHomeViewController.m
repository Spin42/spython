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
@synthesize skinScanViewController;

- (id)init
{
    self = [super init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self setSkinCreationViewController:[[SPSkinCreationViewController alloc] init]];
        [self setSkinScanViewController:[[SPSkinScanViewController alloc] init]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [[[[self navigationController] navigationBar] topItem] setTitleView:titleView];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    CGRect frame = [[self view] frame];
    
    CGRect skinCreationButtonFrame = CGRectMake(0, 40, frame.size.width, frame.size.height / 2);
    [self setSkinCreationButton:[[UIButton alloc] initWithFrame:skinCreationButtonFrame]];
    [[self skinCreationButton] setImage:[UIImage imageNamed:@"addSkinButton.png"] forState:UIControlStateNormal];
    [[self skinCreationButton] addTarget:self
                                  action:@selector(skinCreationButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
    [[self skinCreationButton] setTitle:[[[self skinCreationViewController] title] uppercaseString] forState:UIControlStateNormal];
    [[self view] addSubview:[self skinCreationButton]];
    
    CGRect skinEnrichmentButtonFrame = CGRectMake(0, (frame.size.height / 2) + 40, frame.size.width, frame.size.height / 2);
    [self setSkinEnrichmentButton:[[UIButton alloc] initWithFrame:skinEnrichmentButtonFrame]];
    [[self skinEnrichmentButton] setImage:[UIImage imageNamed:@"scanSkinButton.png"] forState:UIControlStateNormal];
    [[self skinEnrichmentButton] setTitle:[[[self skinScanViewController] title] uppercaseString] forState:UIControlStateNormal];
    [[self view] addSubview:[self skinEnrichmentButton]];
    [[self skinEnrichmentButton] addTarget:self
                                  action:@selector(skinScanButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)skinCreationButtonClicked
{
    [[self navigationController] pushViewController:[self skinCreationViewController] animated:YES];
}

- (void)skinScanButtonClicked
{
    [[self navigationController] pushViewController:[self skinScanViewController] animated:YES];
}

@end
