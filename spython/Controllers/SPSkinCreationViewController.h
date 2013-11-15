//
//  SPAddSkinViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPSkinShootViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface SPSkinCreationViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
CLLocationManagerDelegate>

@property (strong, nonatomic) UITableView *skinsTableView;
@property (strong, nonatomic) NSMutableArray *skins;
@property (strong, nonatomic) SPSkinShootViewController *skinShootViewController;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
