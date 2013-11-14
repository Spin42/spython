//
//  SPImageProperty.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPProperty.h"

@interface SPImageProperty : SPProperty

@property (strong, nonatomic) UIImage *decodedValue;

- (id)initWithKey:(NSString*)_key image:(UIImage*)_value;

@end
