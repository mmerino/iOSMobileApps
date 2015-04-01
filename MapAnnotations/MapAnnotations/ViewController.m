//
//  ViewController.m
//  MapAnnotations
//
//  Created by Maria Merino on 7/30/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "AcademyLocation.h"
#import "MobileMakersAnnotationView.h"

@interface ViewController (){
    
    __weak IBOutlet MKMapView *mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    MKCoordinateSpan span;
    AcademyLocation* academyLocation;

    
    span = MKCoordinateSpanMake(.01, .01);
    coordinate = CLLocationCoordinate2DMake(41.90, -87.65);
    region = MKCoordinateRegionMake(coordinate, span);
    academyLocation = [[AcademyLocation alloc] init];
    
    [super viewDidLoad];
    mapView.region = region;
    academyLocation.title = @"Mobile Makers";
    academyLocation.subtitle = @"Test";
    academyLocation.coordinate = coordinate;
    
    [mapView addAnnotation:academyLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MKMapViewDelegate
-(MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView * annotationView;
    annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationIdentifier"];
    if (annotationView == nil) {
        annotationView = [[MobileMakersAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationIdentifier"];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }else{
        annotationView.annotation = annotation;
    }
    return annotationView;
}

-(void) mapView:(MKMapView *)_mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"I'm Here! %@", view.annotation.title);
}


@end
