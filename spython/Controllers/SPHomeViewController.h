//
//  SPHomeViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPSkinCreationViewController.h"
#import "SPSkinEnrichmentViewController.h"
#import "SPSkinInformationViewController.h"

@interface SPHomeViewController : UIViewController

@property (strong, nonatomic) UIButton *skinCreationButton;
@property (strong, nonatomic) UIButton *skinEnrichmentButton;
@property (strong, nonatomic) UIButton *skinInformationButton;
@property (strong, nonatomic) SPSkinCreationViewController *skinCreationViewController;
@property (strong, nonatomic) SPSkinEnrichmentViewController *skinEnrichmentViewController;
@property (strong, nonatomic) SPSkinInformationViewController *skinInformationViewController;

@end
