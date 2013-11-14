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
        [[self dateLabel] setText:[[textProperty date] description]];
        [[self keyLabel] setText:[textProperty key]];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
