//
//  SPEnrichSkinViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SPSkinShootViewController.h"

@interface SPSkinEnrichmentViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
CLLocationManagerDelegate,
UIAlertViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (strong, nonatomic) SPSkin *currentSkin;
@property (strong, nonatomic) NSArray *properties;
@property (strong, nonatomic) UITableView *propertiesTableView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDictionary *selectedProperty;
@property (strong, nonatomic) SPSkinShootViewController *skinShootViewController;
@property (strong, nonatomic) UIImage *lastSkinImage;

- (id)initWithSkin:(SPSkin*)skin;

@end
