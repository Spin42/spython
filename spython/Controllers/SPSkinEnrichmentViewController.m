//
//  SPEnrichSkinViewController.m
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPHttpClient.h"
#import "SPSkinEnrichmentViewController.h"

@interface SPSkinEnrichmentViewController ()

@end

@implementation SPSkinEnrichmentViewController

@synthesize currentSkin;
@synthesize properties;
@synthesize propertiesTableView;

- (id)initWithSkin:(SPSkin*)skin
{
    self = [super init];
    if (self) {
        [self setCurrentSkin:skin];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
