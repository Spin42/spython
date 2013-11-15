//
//  SPTextCell.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPTextPropertyCell.h"

@implementation SPTextPropertyCell

- (id)initWithProperty:(SPTextProperty*)textProperty
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCellIdentifier"];
    if (self) {
        [self setFormattedDate:[textProperty date]];
        [self setKey:[textProperty key]];
        [self setLogo:[textProperty logoUrl]];
        
        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[self previewView] frame].size.width, [[self previewView] frame].size.height)];
        [valueLabel setNumberOfLines:1];
        [valueLabel setAdjustsFontSizeToFitWidth:YES];
        [valueLabel setTextColor:[UIColor blackColor]];
        [valueLabel setTextAlignment:NSTextAlignmentCenter];
        [valueLabel setText:[[textProperty decodedValue] description]];
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
