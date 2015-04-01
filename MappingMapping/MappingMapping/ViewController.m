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
    
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *rowArray = [allDataDictionary objectForKey:@"row"];
        NSLog(@"%@",rowArray);
        NSLog(@"%i", [rowArray count]);
        
        
        //enumerate through this part
        for (int i = 0; i< [rowArray count]; i++) {
            NSDictionary *stopDictionary = [rowArray objectAtIndex:i];
            NSString *name = [stopDictionary objectForKey:@"cta_stop_name"];
            NSString *routes = [stopDictionary objectForKey:@"routes"];
            float latitude = [[stopDictionary objectForKey:@"latitude"] floatValue];
            float longitude = [[stopDictionary objectForKey:@"longitude"] floatValue];
            
            
            
            NSLog(@"%@ %@ %f %f", name, routes, latitude, longitude);
            
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

@end
