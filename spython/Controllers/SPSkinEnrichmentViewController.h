//
//  SPEnrichSkinViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <UIKit/UIKit.h>

@interface SPSkinEnrichmentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SPSkin *currentSkin;
@property (strong, nonatomic) NSArray *properties;
@property (strong, nonatomic) UITableView *propertiesTableView;

- (id)initWithSkin:(SPSkin*)skin;

@end
