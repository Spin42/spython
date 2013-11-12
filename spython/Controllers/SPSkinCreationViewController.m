//
//  SPAddSkinViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkinCreationViewController.h"

@interface SPSkinCreationViewController ()

@end

@implementation SPSkinCreationViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self setTitle:@"Add Skin"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                     style:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(handleBack)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor greenColor]];
}

- (void)handleBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
