//
//  SPLocationCell.h
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SPPropertyCell.h"
#import "SPLocationProperty.h"

@interface SPLocationPropertyCell : SPPropertyCell <MKMapViewDelegate>

- (id)initWithProperty:(SPLocationProperty*)locationProperty;

@end
