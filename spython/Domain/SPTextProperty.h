//
//  SPTextProperty.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPProperty.h"
#import <Foundation/Foundation.h>

@interface SPTextProperty : SPProperty

@property (strong, nonatomic) NSString *decodedValue;

- (id)initWithKey:(NSString*)_key text:(NSString*)_value;

@end
