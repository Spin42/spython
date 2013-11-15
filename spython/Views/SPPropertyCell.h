//
//  SPPropertyCell.h
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPRemoteImageView.h"

@interface SPPropertyCell : UITableViewCell

@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *keyLabel;
@property (strong, nonatomic) UIView *previewView;
@property (strong, nonatomic) UIImageView *logoImageView;

- (void)setFormattedDate:(NSDate*)date;
- (void)setKey:(NSString*)key;
- (void)setLogo:(NSString*)url;

@end
