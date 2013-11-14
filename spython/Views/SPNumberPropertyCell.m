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
        [[self dateLabel] setText:[[numberProperty date] description]];
        [[self keyLabel] setText:[numberProperty key]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
