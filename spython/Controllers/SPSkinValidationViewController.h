//
//  SPSkinValidationViewController.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <UIKit/UIKit.h>

@interface SPSkinValidationViewController : UIViewController

@property (strong, nonatomic) SPSkin *currentSkin;
@property (strong, nonatomic) UIImageView *skinImageView;
@property (strong, nonatomic) UITextField *skinTokenTextField;

@end
