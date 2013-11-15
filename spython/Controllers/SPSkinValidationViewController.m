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
@synthesize imageView;
@synthesize tokenView;

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
    
    CGRect skinImageViewFrame = frame;
    [self setImageView:[[UIImageView alloc] initWithFrame:skinImageViewFrame]];
    [[self view] addSubview:[self imageView]];
    
    [self setTokenView:[[SPTokenView alloc] initWithFrame:CGRectMake(0, frame.size.height - 200, frame.size.width, 40)]];
    [[self view] addSubview:[self tokenView]];
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
    [[self tokenView] setText:[[self currentSkin] token]];
    SPImageProperty *firstImageProperty = [[self currentSkin] firstImageProperty];
    [[self imageView] setImage:[firstImageProperty decodedValue]];
}


@end
