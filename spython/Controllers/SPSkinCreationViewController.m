//
//  SPAddSkinViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPSkinService.h"
#import "SPImageProperty.h"
#import "SPLocationProperty.h"
#import "SPSkinCreationViewController.h"
#import "SPSkinValidationViewController.h"
#import "SPSkinInformationViewController.h"

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadSkins];
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

- (void)loadSkins
{
    [[SPSkinService sharedInstance] getAll:^(NSDictionary *skinsResource) {
        [self setSkins:[[NSMutableArray alloc] initWithArray:[[skinsResource objectForKey:@"_links"] objectForKey:@"skins"]]];
        [self reloadTableView];
    } failed:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Oops"
                                    message:@"The skins can't be loaded, please try later."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }];
}

- (void)addSkinForPicture:(UIImage*)picture
{
    NSMutableArray *properties = [[NSMutableArray alloc] init];
    [properties addObject:[[[SPImageProperty alloc] initWithKey:@"image" image:picture] toDictionary]];
    [properties addObject:[[[SPLocationProperty alloc] initWithKey:@"location" location:[[self locationManager] location]] toDictionary]];
    
    [[SPSkinService sharedInstance] create:properties succeeded:^(NSDictionary *resource) {
        NSString *resourceUrl = [[[resource objectForKey:@"_links"] objectForKey:@"self"] objectForKey:@"href"];
        [[self navigationController] pushViewController:[[SPSkinValidationViewController alloc] initWithUrl:resourceUrl] animated:YES];
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
    
    NSDictionary *skinRessourceDictionary = [[self skins] objectAtIndex:[indexPath row]];

    [[cell textLabel] setText:[skinRessourceDictionary objectForKey:@"token"]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self skins] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *skinRessourceDictionary = [[self skins] objectAtIndex:[indexPath row]];
    NSString *href = [skinRessourceDictionary objectForKey:@"href"];
    SPSkinInformationViewController *skinInformationViewController = [[SPSkinInformationViewController alloc] initWithUrl:href];
    [[self navigationController] pushViewController:skinInformationViewController animated:YES];
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
