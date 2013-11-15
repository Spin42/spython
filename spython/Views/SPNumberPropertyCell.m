//
//  SPNumberCell.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPNumberPropertyCell.h"

@implementation SPNumberPropertyCell

- (id)initWithProperty:(SPNumberProperty*)numberProperty
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"numberCellIdentifier"];
    if (self) {
        [self setFormattedDate:[numberProperty date]];
        [self setKey:[numberProperty key]];
        [self setLogo:[numberProperty logoUrl]];

        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[self previewView] frame].size.width, [[self previewView] frame].size.height)];
        [valueLabel setNumberOfLines:1];
        [valueLabel setAdjustsFontSizeToFitWidth:YES];
        [valueLabel setTextColor:[UIColor blackColor]];
        [valueLabel setTextAlignment:NSTextAlignmentCenter];
        NSString *value;
        if ([numberProperty unit])
            value = [NSString stringWithFormat:@"%@ %@",[numberProperty decodedValue], [numberProperty unit]];
        else
            value = [[numberProperty decodedValue] description];
        [valueLabel setText:value];
        [[self previewView] addSubview:valueLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
