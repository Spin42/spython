//
//  SPSkinInformationViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPSkinService.h"
#import "SPSkinInformationViewController.h"

@interface SPSkinInformationViewController ()

@end

@implementation SPSkinInformationViewController

- (id)initWithUrl:(NSString*)url;
{
    self = [super init];
    if (self) {
        [self setUrl:url];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor purpleColor]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[SPSkinService sharedInstance] get:[self url] succeeded:^(SPSkin *skin) {
        [self setCurrentSkin:skin];
        [self updateInformation];
    } failed:^(NSError *error) {
        NSLog(@"Fail to get skin :(");
    }];
}

- (void)updateInformation
{
    NSLog(@"PLOP %@", [[self currentSkin] token]);
}

@end
