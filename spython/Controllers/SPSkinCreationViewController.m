//
//  SPAddSkinViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPSkinService.h"
#import "SPSkinCreationViewController.h"

@interface SPSkinCreationViewController ()

@end

@implementation SPSkinCreationViewController

@synthesize skinsTableView;
@synthesize skins;
@synthesize skinScanViewController;

- (id)init
{
    self = [super init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self setTitle:@"My Skins"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                                     style:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(handleBack)]];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                                      style:UIBarButtonItemStylePlain
                                                                                     target:self
                                                                                     action:@selector(handleAdd)]];
        
        [self setSkins:[[NSMutableArray alloc] init]];
        [self setSkinsTableView:[[UITableView alloc] initWithFrame:[[self view] frame]]];
        [[self skinsTableView] setDelegate:self];
        [[self skinsTableView] setDataSource:self];
        [[self view] addSubview:[self skinsTableView]];
        
        [self setSkinScanViewController:[[SPSkinShootViewController alloc] init]];
        [[self skinScanViewController] setDelegate:self];
        
        [self setLocationManager:[[CLLocationManager alloc] init]];
        [[self locationManager] setDelegate:self];
        [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor greenColor]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[self locationManager] startUpdatingLocation];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[self locationManager] stopUpdatingLocation];
}

- (void)handleBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)handleAdd
{
    if (![[self locationManager] location])
    {
        [[[UIAlertView alloc] initWithTitle:@"No Location"
                                                        message:@"Your location is not yet found, please try later."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil] show];
    } else
        [self presentViewController:[self skinScanViewController] animated:YES completion:nil];
}

- (void)addSkinForPicture:(UIImage*)picture
{
    SPSkin *skin = [[SPSkin alloc] init];
    [skin setPicture:picture];
    [skin setLocation:[[self locationManager] location]];
    [[SPSkinService sharedInstance] addSkin:skin succeeded:^(SPSkin *skin) {
        [[self skins] addObject:skin];
        [self reloadTableView];
    } failed:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Oops"
                                    message:@"The new skin can't be added, please try later."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }];
}

#pragma mark - Table View Protocol

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"skinItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    SPSkin *skin = [[self skins] objectAtIndex:[indexPath row]];

    [[cell textLabel] setText:[skin token]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self skins] count];
}

#pragma mark - Camera Protocol

- (void)imagePickerController: (UIImagePickerController *)pickerConrtoller didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[self skinScanViewController] dismissViewControllerAnimated:YES completion:nil];
    [self addSkinForPicture:(UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage]];
}

- (void)reloadTableView
{
    [[self skinsTableView] reloadData];
}

#pragma mark - Location Manager Protocol

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Got a new location...");
}

@end
