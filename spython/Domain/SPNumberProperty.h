//
//  SPNumberProperty.h
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPProperty.h"

@interface SPNumberProperty : SPProperty

@property (strong, nonatomic) NSNumber *decodedValue;

- (id)initWithKey:(NSString*)_key number:(NSNumber*)_value;

@end
