//
//  SPImageCell.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPImagePropertyCell.h"

@implementation SPImagePropertyCell

- (id)initWithProperty:(SPImageProperty*)imageProperty
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageCellIdentifier"];
    if (self) {
        [self setFormattedDate:[imageProperty date]];
        [self setKey:[imageProperty key]];
        [self setLogo:[imageProperty logoUrl]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[self previewView] frame].size.width, [[self previewView] frame].size.height)];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setImage:[imageProperty decodedValue]];
        [[self previewView] addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
