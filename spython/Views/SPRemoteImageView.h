//
//  SPRemoteImageView.h
//  spython
//
//  Created by loo on 15/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface SPRemoteImageView : UIImageView

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage success:(void (^)(NSURLRequest *, NSHTTPURLResponse *, UIImage *))success failure:(void (^)(NSURLRequest *, NSHTTPURLResponse *, NSError *))failure;

@end
