//
//  SPPropertyCell.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPPropertyCell.h"

@implementation SPPropertyCell

@synthesize keyLabel;
@synthesize dateLabel;
@synthesize previewView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect contentViewFrame = [[self contentView] frame];
        
        [self setDateLabel:[[UILabel alloc] initWithFrame:CGRectMake(0, 0, contentViewFrame.size.width / 2, 40)]];
        [self setKeyLabel:[[UILabel alloc] initWithFrame:CGRectMake(0, 40, contentViewFrame.size.width / 2, 40)]];
        [[self contentView] addSubview:[self dateLabel]];
        [[self contentView] addSubview:[self keyLabel]];
        [self setPreviewView:[[UIView alloc] initWithFrame:CGRectMake(contentViewFrame.size.width / 2,
                                                                      0,
                                                                      contentViewFrame.size.width / 2,
                                                                      80)]];
        [[self contentView] addSubview:[self previewView]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
