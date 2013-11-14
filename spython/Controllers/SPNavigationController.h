//
//  SPNavigationController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPHomeViewController.h"

@interface SPNavigationController : UINavigationController

@property (strong, nonatomic) SPHomeViewController *homeViewController;
@property (strong, nonatomic) UIView *activityIndicatorView;
@property (assign, nonatomic) int *activityIndicatorViewCount;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
