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
@synthesize skinInformationViewController;

- (id)init
{
    self = [super init];
    if (self) {
        [self setSkinCreationViewController:[[SPSkinCreationViewController alloc] init]];
        [self setSkinEnrichmentViewController:[[SPSkinEnrichmentViewController alloc] init]];
        [self setSkinInformationViewController:[[SPSkinInformationViewController alloc] init]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor redColor]];
    
    CGRect frame = [[self view] frame];
    
    CGRect skinCreationButtonFrame = CGRectMake(0, 10, frame.size.width, 80);
    [self setSkinCreationButton:[[UIButton alloc] initWithFrame:skinCreationButtonFrame]];
    [[self skinCreationButton] addTarget:self
                                  action:@selector(skinCreationButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
    [[self skinCreationButton] setTitle:@"Add Skin" forState:UIControlStateNormal];
    [[self view] addSubview:[self skinCreationButton]];
    
    CGRect skinEnrichmentButtonFrame = CGRectMake(0, 100, frame.size.width, 80);
    [self setSkinEnrichmentButton:[[UIButton alloc] initWithFrame:skinEnrichmentButtonFrame]];
    [[self skinEnrichmentButton] setTitle:@"Enrich Skin" forState:UIControlStateNormal];
    [[self view] addSubview:[self skinEnrichmentButton]];
    [[self skinEnrichmentButton] addTarget:self
                                  action:@selector(skinEnrichmentButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
    
    CGRect skinInformationButtonFrame = CGRectMake(0, 200, frame.size.width, 80);
    [self setSkinInformationButton:[[UIButton alloc] initWithFrame:skinInformationButtonFrame]];
    [[self skinInformationButton] setTitle:@"View Skin" forState:UIControlStateNormal];

    [[self view] addSubview:[self skinInformationButton]];
    [[self skinInformationButton] addTarget:self
                                  action:@selector(skinInformationButtonClicked)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)skinCreationButtonClicked
{
    [[self navigationController] pushViewController:[self skinCreationViewController] animated:YES];
}

- (void)skinEnrichmentButtonClicked
{
    [[self navigationController] pushViewController:[self skinEnrichmentViewController] animated:YES];

}

- (void)skinInformationButtonClicked
{
    [[self navigationController] pushViewController:[self skinInformationViewController] animated:YES];
 
}

@end
