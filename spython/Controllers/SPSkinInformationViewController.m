//
//  SPSkinInformationViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkinInformationViewController.h"

@interface SPSkinInformationViewController ()

@end

@implementation SPSkinInformationViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self setTitle:@"View Skin"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                                     style:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(handleBack)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor purpleColor]];
}

- (void)handleBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
