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
@synthesize logoImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect contentViewFrame = [[self contentView] frame];
        
        [self setKeyLabel:[[UILabel alloc] initWithFrame:CGRectMake(80, 10, contentViewFrame.size.width / 2, 40)]];
        [[self contentView] addSubview:[self keyLabel]];
        [[self keyLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        
        [self setDateLabel:[[UILabel alloc] initWithFrame:CGRectMake(80, 30, contentViewFrame.size.width / 2, 40)]];
        [[self dateLabel] setTextColor:[UIColor lightGrayColor]];
        [[self dateLabel] setFont:[UIFont boldSystemFontOfSize:13]];
        [[self contentView] addSubview:[self dateLabel]];

        [self setPreviewView:[[UIView alloc] initWithFrame:CGRectMake(contentViewFrame.size.width - 100,
                                                                      0,
                                                                      100,
                                                                      80)]];
        [[self contentView] addSubview:[self previewView]];
        
        [self setLogoImageView:[[SPRemoteImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)]];
        [self addSubview:[self logoImageView]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:animated];
}

- (void)setFormattedDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    [[self dateLabel] setText:[formatter stringFromDate:[NSDate date]]];
}

- (void)setKey:(NSString*)key
{
    [[self keyLabel] setText:[key capitalizedString]];
}

- (void)setLogo:(NSString*)url
{
    [[self logoImageView] setImageWithURL:[NSURL URLWithString:url]];
}
@end
