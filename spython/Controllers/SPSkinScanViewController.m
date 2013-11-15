//
//  SPScanViewController.m
//  spython
//
//  Created by loo on 15/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPHttpClient.h"
#import <QuartzCore/QuartzCore.h>
#import "SPNavigationController.h"
#import "SPSkinScanViewController.h"
#import "SPSkinInformationViewController.h"

@interface SPSkinScanViewController ()

@end

@implementation SPSkinScanViewController

@synthesize tokenTextField;

- (id)init
{
    self = [super init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self setTitle:@"Scan Skin"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                                     style:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(handleBack)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    CGRect frame = [[self view] frame];
    [self setTokenTextField:[[UITextField alloc] initWithFrame:CGRectMake(20, (frame.size.height / 2) - 20, frame.size.width - 40, 40)]];
    [[[self tokenTextField] layer] setMasksToBounds:YES];
    [[[self tokenTextField] layer] setBorderWidth:1.0f];
    [[[self tokenTextField] layer] setBorderColor:[[UIColor colorWithRed:0.78 green:0.78 blue:0.784 alpha:1.0] CGColor]];
    [[self tokenTextField] setTextAlignment:NSTextAlignmentCenter];
    [[self tokenTextField] setPlaceholder:@"Enter your token"];
    [[self tokenTextField] setDelegate:self];
    [[self view] addSubview:[self tokenTextField]];
}

- (void)handleBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [textField setText:[[textField text] stringByReplacingCharactersInRange:range withString:[string uppercaseString]]];
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self scanToken:[textField text]];
    return NO;
}

- (void)scanToken:(NSString*)token
{
    [(SPNavigationController*)[self navigationController] showActivityIndicator];
    NSString *url = [NSString stringWithFormat:@"/api/tokens/%@", token];
    [[SPHttpClient sharedInstance] GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *href = [[[responseObject objectForKey:@"_links"] objectForKey:@"skin"] objectForKey:@"href"];
        SPSkinInformationViewController *skinInformationViewController = [[SPSkinInformationViewController alloc] initWithUrl:href];
        [[self navigationController] pushViewController:skinInformationViewController animated:YES];
        [(SPNavigationController*)[self navigationController] hideActivityIndicator];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}


@end
