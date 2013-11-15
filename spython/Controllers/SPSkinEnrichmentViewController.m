//
//  SPEnrichSkinViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPHttpClient.h"
#import "SPTextProperty.h"
#import "SPImageProperty.h"
#import "SPNumberProperty.h"
#import "SPLocationProperty.h"
#import "SPNavigationController.h"
#import "SPSkinEnrichmentViewController.h"

@interface SPSkinEnrichmentViewController ()

@end

static int LOCATION_ALERTVIEW_TAG = 0;
static int NUMBER_ALERTVIEW_TAG = 1;
static int TEXT_ALERTVIEW_TAG = 2;
static int IMAGE_ALERTVIEW_TAG = 3;

@implementation SPSkinEnrichmentViewController

@synthesize currentSkin;
@synthesize properties;
@synthesize propertiesTableView;
@synthesize locationManager;
@synthesize selectedProperty;
@synthesize skinShootViewController;
@synthesize lastSkinImage;

- (id)initWithSkin:(SPSkin*)skin
{
    self = [super init];
    if (self) {
        [self setCurrentSkin:skin];
        
        [self setLocationManager:[[CLLocationManager alloc] init]];
        [[self locationManager] setDelegate:self];
        [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
        
        [self setSkinShootViewController:[[SPSkinShootViewController alloc] init]];
        [[self skinShootViewController] setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    [self setPropertiesTableView:[[UITableView alloc] initWithFrame:[[self view] frame]]];
    [[self propertiesTableView] setDelegate:self];
    [[self propertiesTableView] setDataSource:self];
    [[self view] addSubview:[self propertiesTableView]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *propertiesUrl = [[[[self currentSkin] links] objectForKey:@"properties_dictionary"] objectForKey:@"href"];
    [[SPHttpClient sharedInstance] GET:propertiesUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self setProperties:[responseObject objectForKey:@"properties"]];
        [[self propertiesTableView] reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table View Protocol

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"propertyItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    NSDictionary *propertyDictionary = [[self properties] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[[propertyDictionary objectForKey:@"key"] capitalizedString]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self properties] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSDictionary *property = [[self properties] objectAtIndex:[indexPath row]];
    [self setSelectedProperty:property];
    
    if ([[property objectForKey:@"type"] isEqualToString:@"Text"])
        [self addTextProperty];
    else if([[property objectForKey:@"type"] isEqualToString:@"Number"])
        [self addNumberProperty];
    else if([[property objectForKey:@"type"] isEqualToString:@"Location"])
        [self addLocationProperty];
    else if([[property objectForKey:@"type"] isEqualToString:@"Image"])
        [self addImageProperty];
}

#pragma mark - UI Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    SPProperty *property;
    if (buttonIndex == 0)
        return;
    if ([alertView tag] == NUMBER_ALERTVIEW_TAG) {
        property = [[SPNumberProperty alloc] initWithKey:[[self selectedProperty] objectForKey:@"key"]
                                                  number:[NSNumber numberWithInt:[[[alertView textFieldAtIndex:0] text] intValue]]];
        [property setUnit:[[self selectedProperty] objectForKey:@"unit"]];
    }
    else if ([alertView tag] == LOCATION_ALERTVIEW_TAG)
        property = [[SPLocationProperty alloc] initWithKey:[[self selectedProperty] objectForKey:@"key"]
                                                                location:[[self locationManager] location]];
    else if ([alertView tag] == TEXT_ALERTVIEW_TAG)
        property = [[SPTextProperty alloc] initWithKey:[[self selectedProperty] objectForKey:@"key"]
                                                  text:[[alertView textFieldAtIndex:0] text]];
    else if ([alertView tag] == IMAGE_ALERTVIEW_TAG)
        property = [[SPImageProperty alloc] initWithKey:[[self selectedProperty] objectForKey:@"key"]
                                                  image:[self lastSkinImage]];
    [self saveProperty:property];
}

- (void)addTextProperty
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[[self selectedProperty] objectForKey:@"key"] capitalizedString]
                                                        message:[NSString stringWithFormat:@"Enter value for %@:",[[self selectedProperty] objectForKey:@"key"]]
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[alertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeAlphabet];
    [alertView setTag:TEXT_ALERTVIEW_TAG];
    [alertView show];
}

- (void)addNumberProperty
{
    NSString *message;
    if ([[self selectedProperty] objectForKey:@"unit"])
        message = [NSString stringWithFormat:@"Enter value for %@ in %@:",[[self selectedProperty] objectForKey:@"key"],[[self selectedProperty] objectForKey:@"unit"]];
    else
        message = [NSString stringWithFormat:@"Enter value for %@:",[[self selectedProperty] objectForKey:@"key"]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[[self selectedProperty] objectForKey:@"key"] capitalizedString]
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[alertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeDecimalPad];
    [alertView setTag:NUMBER_ALERTVIEW_TAG];
    [alertView show];
}

- (void)addLocationProperty
{
    NSString *message = [NSString stringWithFormat:@"Use your current location %@ ?",[[[self locationManager] location] description]];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[[self selectedProperty] objectForKey:@"key"] capitalizedString]
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
    [alertView setTag:LOCATION_ALERTVIEW_TAG];
    [alertView show];
}

- (void)addImageProperty
{
    [self presentViewController:[self skinShootViewController] animated:YES completion:nil];
}

- (void)confirmAddImageProperty
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[[self selectedProperty] objectForKey:@"key"] capitalizedString]
                                                        message:@"Use last picture ?"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
    [alertView setTag:IMAGE_ALERTVIEW_TAG];
    [alertView show];
}

- (void)saveProperty:(SPProperty*)property
{
    [(SPNavigationController*)[self navigationController] showActivityIndicator];
    
    NSString *skinPropertiesUrl = [[[[self currentSkin] links] objectForKey:@"enrich"] objectForKey:@"href"];
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:[property toDictionary], @"property", nil];
    [[SPHttpClient sharedInstance] POST:skinPropertiesUrl parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [(SPNavigationController*)[self navigationController] hideActivityIndicator];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Camera Protocol

- (void)imagePickerController: (UIImagePickerController *)pickerConrtoller didFinishPickingMediaWithInfo:(NSDictionary *)info
{    
    [[self skinShootViewController] dismissViewControllerAnimated:YES completion:^{
        [self setLastSkinImage:(UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage]];
        [self confirmAddImageProperty];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[self skinShootViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
