//
//  ViewController.m
//  MappingMapping
//
//  Created by Maria Merino on 7/30/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "StopsAnnotation.h"
#import "StopsAnnotationView.h"


@interface ViewController (){
    __weak IBOutlet MKMapView *myMapView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = 41.89385;
    coordinate.longitude = -87.73534;
    region = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000);
    myMapView.region = region;
    
    CLLocationCoordinate2D loopPoints[10];
    
    loopPoints[0] = CLLocationCoordinate2DMake(41.8845, -87.6207);
    loopPoints[1] = CLLocationCoordinate2DMake(41.8885, -87.6206);
    loopPoints[2] = CLLocationCoordinate2DMake(41.8889, -87.6250);
    loopPoints[3] = CLLocationCoordinate2DMake(41.8874, -87.6279);
    loopPoints[4] = CLLocationCoordinate2DMake(41.8873, -87.6357);
    loopPoints[5] = CLLocationCoordinate2DMake(41.8862, -87.6377);
    loopPoints[6] = CLLocationCoordinate2DMake(41.8810, -87.6383);
    loopPoints[7] = CLLocationCoordinate2DMake(41.8757, -87.6368);
    loopPoints[8] = CLLocationCoordinate2DMake(41.8756, -87.6243);
    loopPoints[9] = CLLocationCoordinate2DMake(41.8843, -87.6245);
    
    MKPolygon* loopPoly = [MKPolygon polygonWithCoordinates:loopPoints count:10];
    loopPoly.title = @"The Loop";
    
    //MKPolygonView *polyView = [[MKPolygonView alloc]initWithPolygon:loopPoly];
    
    [myMapView addOverlay:loopPoly];
    
    NSLog(@"%f %f", loopPoints[7].latitude, loopPoints[7].longitude);
    
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *rowArray = [allDataDictionary objectForKey:@"row"];
        
        //enumerate through this part
        for (int i = 0; i< [rowArray count]; i++) {
            NSDictionary *stopDictionary = [rowArray objectAtIndex:i];
            NSString *name = [stopDictionary objectForKey:@"cta_stop_name"];
            NSString *routes = [stopDictionary objectForKey:@"routes"];
            float latitude = [[stopDictionary objectForKey:@"latitude"] floatValue];
            float longitude = [[stopDictionary objectForKey:@"longitude"] floatValue];
            
            StopsAnnotation *stopPoint = [[StopsAnnotation alloc] init];
            
            stopPoint.title = name;
            stopPoint.subtitle = routes;
            stopPoint.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            
            [myMapView addAnnotation:stopPoint];
        }
     
    }];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MKMapViewDelegate
-(MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView * annotationView;
    annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnoId"];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnoId"];
        //Change the above line's MKPin... to custome AnnotationView Class with custom image
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }else{
        annotationView.annotation = annotation;
    }
    return annotationView;
}

#pragma mark Overlay Stuff

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay{
    MKPolygonView *polygonView = [[MKPolygonView alloc] initWithPolygon:overlay];
    polygonView.lineWidth = 2.0;
    polygonView.strokeColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1];
    polygonView.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:.5];
    return polygonView;
}

@end
