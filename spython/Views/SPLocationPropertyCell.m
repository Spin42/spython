//
//  SPLocationCell.m
//  spython
//
//  Created by loo on 14/11/13.
//  Copyright (c) 2013 Spin42. All rights reserved.
//

#import "SPAnnotation.h"
#import "SPLocationPropertyCell.h"

@implementation SPLocationPropertyCell

- (id)initWithProperty:(SPLocationProperty*)locationProperty
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"locationCellIdentifier"];
    if (self) {
        [[self dateLabel] setText:[[locationProperty date] description]];
        [[self keyLabel] setText:[locationProperty key]];
        
        MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [[self previewView] frame].size.width, [[self previewView] frame].size.height)];
        SPAnnotation *annotation = [[SPAnnotation alloc] init];
        [annotation setCoordinate:CLLocationCoordinate2DMake([[locationProperty decodedValue] coordinate].latitude,
                                                             [[locationProperty decodedValue] coordinate].longitude)];
        [mapView addAnnotation:annotation];
        [mapView setCenterCoordinate:[annotation coordinate] animated:YES];
        [mapView setDelegate:self];
        [[self previewView] addSubview:mapView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark MapView Protocol

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    MKPinAnnotationView *pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationIdentifier"];
    return pinAnnotationView;
}

@end
