//
//  SPTokenView.h
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTokenView : UIView

@property (strong, nonatomic) UILabel *tokenLabel;

- (id)initWithFrame:(CGRect)frame;
- (void)setText:(NSString*)token;

@end
