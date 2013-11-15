//
//  SPSkinValidationViewController.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import "SPTokenView.h"
#import <UIKit/UIKit.h>

@interface SPSkinValidationViewController : UIViewController

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) SPSkin *currentSkin;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) SPTokenView *tokenView;

- (id)initWithUrl:(NSString*)url;

@end
