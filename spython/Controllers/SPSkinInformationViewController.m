//
//  SPSkinInformationViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPSkinInformationViewController.h"

@interface SPSkinInformationViewController ()

@end

@implementation SPSkinInformationViewController

- (id)initWithSkin:(SPSkin*)skin
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor purpleColor]];
}


@end
