//
//  SPSkinInformationViewController.h
//  spython
//
//  Created by loo on 12/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPSkin.h"
#import <UIKit/UIKit.h>

@interface SPSkinInformationViewController : UIViewController

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) SPSkin *currentSkin;

- (id)initWithUrl:(NSString*)url;

@end
