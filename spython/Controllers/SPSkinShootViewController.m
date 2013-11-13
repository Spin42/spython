//
//  SPSkinScanViewController.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkinShootViewController.h"

@interface SPSkinShootViewController ()

@end

@implementation SPSkinShootViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self setAllowsEditing:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
