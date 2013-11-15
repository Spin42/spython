//
//  SPTokenView.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPTokenView.h"

@implementation SPTokenView

@synthesize tokenLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
        [topView setBackgroundColor:[UIColor colorWithRed:0.78 green:0.78 blue:0.784 alpha:1.0]];
        [self addSubview:topView];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 1, frame.size.width, 1)];
        [bottomView setBackgroundColor:[UIColor colorWithRed:0.78 green:0.78 blue:0.784 alpha:1.0]];
        [self addSubview:bottomView];
        
        CGRect titleLabelFrame = CGRectMake(10, 0, 100, frame.size.height);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLabelFrame];
        [titleLabel setText:@"ID"];
        [self addSubview:titleLabel];
        
        CGRect tokenLabelFrame = CGRectMake(frame.size.width - 110, 0, 100, frame.size.height);
        [self setTokenLabel:[[UILabel alloc] initWithFrame:tokenLabelFrame]];
        [[self tokenLabel] setTextAlignment:NSTextAlignmentRight];
        [[self tokenLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        [self addSubview:[self tokenLabel]];
    }
    return self;
}

- (void)setText:(NSString*)token
{
    [[self tokenLabel] setText:token];
}

@end
