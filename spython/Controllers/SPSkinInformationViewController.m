//
//  SPSkinInformationViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPSkinService.h"
#import "SPTextPropertyCell.h"
#import "SPImagePropertyCell.h"
#import "SPNumberPropertyCell.h"
#import "SPNavigationController.h"
#import "SPLocationPropertyCell.h"
#import "SPSkinInformationViewController.h"

@interface SPSkinInformationViewController ()

@end

@implementation SPSkinInformationViewController

@synthesize currentSkin;
@synthesize url;
@synthesize lastImageView;
@synthesize propertiesTableView;
@synthesize skinEnrichmentViewController;
@synthesize tokenView;

- (id)initWithUrl:(NSString*)_url;
{
    self = [super init];
    if (self) {
        [self setUrl:_url];
        [self setAutomaticallyAdjustsScrollViewInsets:YES];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Enrich"
                                                                                      style:UIBarButtonItemStylePlain
                                                                                     target:self
                                                                                     action:@selector(handleEnrich)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    CGRect frame = [[self view] frame];
    
    [self setPropertiesTableView:[[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                               60,
                                                                               frame.size.width,
                                                                               frame.size.height - 70 - [[[self navigationController] navigationBar] frame].size.height)]];
    [[self propertiesTableView] setDelegate:self];
    [[self propertiesTableView] setDataSource:self];
    [[self view] addSubview:[self propertiesTableView]];
    
    [self setTokenView:[[SPTokenView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 40)]];
    [[self view] addSubview:[self tokenView]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [(SPNavigationController*)[self navigationController] showActivityIndicator];

    [[SPSkinService sharedInstance] get:[self url] succeeded:^(SPSkin *skin) {
        [self setCurrentSkin:skin];
        [self updateInformation];
        [self setSkinEnrichmentViewController:[[SPSkinEnrichmentViewController alloc] initWithSkin:skin]];
        [(SPNavigationController*)[self navigationController] hideActivityIndicator];
    } failed:^(NSError *error) {
        NSLog(@"Fail to get skin :(");
    }];
}

- (void)handleEnrich
{
    [[self navigationController] pushViewController:[self skinEnrichmentViewController] animated:YES];
}

- (void)updateInformation
{
    [[self tokenView] setText:[[self currentSkin] token]];
    [[self propertiesTableView] reloadData];
}

#pragma mark - Table View Protocol

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"skinPropertyItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    SPProperty *skinProperty = [[[self currentSkin] properties] objectAtIndex:[indexPath row]];

    if (cell == nil && [skinProperty isKindOfClass:[SPImageProperty class]])
        cell = [[SPImagePropertyCell alloc] initWithProperty:(SPImageProperty*)skinProperty];
    else if (cell == nil && [skinProperty isKindOfClass:[SPLocationProperty class]])
        cell = [[SPLocationPropertyCell alloc] initWithProperty:(SPLocationProperty*)skinProperty];
    else if (cell == nil && [skinProperty isKindOfClass:[SPTextProperty class]])
        cell = [[SPTextPropertyCell alloc] initWithProperty:(SPTextProperty*)skinProperty];
    else if (cell == nil && [skinProperty isKindOfClass:[SPNumberProperty class]])
        cell = [[SPNumberPropertyCell alloc] initWithProperty:(SPNumberProperty*)skinProperty];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self currentSkin] properties] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    SPProperty *skinPropertyDictionary = [[[self currentSkin] properties] objectAtIndex:[indexPath row]];
}

@end
