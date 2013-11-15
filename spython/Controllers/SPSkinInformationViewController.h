//
//  SPSkinInformationViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <UIKit/UIKit.h>
#import "SPTokenView.h"
#import "SPSkinEnrichmentViewController.h"

@interface SPSkinInformationViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) SPSkin *currentSkin;
@property (strong, nonatomic) UIImageView *lastImageView;
@property (strong, nonatomic) UITableView *propertiesTableView;
@property (strong, nonatomic) SPSkinEnrichmentViewController *skinEnrichmentViewController;
@property (strong, nonatomic) SPTokenView *tokenView;

- (id)initWithUrl:(NSString*)url;

@end
