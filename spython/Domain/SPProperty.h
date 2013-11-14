//
//  SPProperty.h
//  spython
//
//  Created by loo on 13/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPProperty : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSDate *date;

-(NSDictionary*)toDictionary;
- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
