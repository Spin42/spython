//
//  SPSkinValidationViewController.m
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkinService.h"
#import "SPImageProperty.h"
#import "SPSkinValidationViewController.h"

@interface SPSkinValidationViewController ()

@end

@implementation SPSkinValidationViewController

@synthesize currentSkin;
@synthesize skinImageView;
@synthesize skinTokenLabel;

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
    
    CGRect frame = [[self view] frame];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    CGRect skinImageViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.width);
    [self setSkinImageView:[[UIImageView alloc] initWithFrame:skinImageViewFrame]];
    [[self view] addSubview:[self skinImageView]];
    
    CGRect skinTokenLabelFrame = CGRectMake(0, frame.size.width, frame.size.width, frame.size.height - frame.size.width);
    [self setSkinTokenLabel:[[UILabel alloc] initWithFrame:skinTokenLabelFrame]];
    [[self skinTokenLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self skinTokenLabel] setTextColor:[UIColor grayColor]];
    [[self view] addSubview:[self skinTokenLabel]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[SPSkinService sharedInstance] get:[self url] succeeded:^(SPSkin *skin) {
        [self setCurrentSkin:skin];
        [self updateInformation];
    } failed:^(NSError *error) {
        NSLog(@"Fail to get skin :(");
    }];
}

- (void)updateInformation
{
    [[self skinTokenLabel] setText:[[self currentSkin] token]];
    SPImageProperty *firstImageProperty = [[self currentSkin] firstImageProperty];
    [[self skinImageView] setImage:[firstImageProperty decodedValue]];
}


@end
