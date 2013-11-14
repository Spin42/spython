//
//  SPLocationProperty.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPProperty.h"
#import <CoreLocation/CoreLocation.h>

@interface SPLocationProperty : SPProperty

@property (strong, nonatomic) CLLocation *decodedValue;

- (id)initWithKey:(NSString*)_key location:(CLLocation*)_value;

@end
