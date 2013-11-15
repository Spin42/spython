//
//  SPRemoteImageView.m
//  spython
//
//  Created by loo on 15/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPRemoteImageView.h"

@implementation SPRemoteImageView

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:nil failure:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage success:(void (^)(NSURLRequest *, NSHTTPURLResponse *, UIImage *))success failure:(void (^)(NSURLRequest *, NSHTTPURLResponse *, NSError *))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:success failure:failure];
}

@end
