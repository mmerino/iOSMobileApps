//
//  ViewController.m
//  MapIt
//
//  Created by Maria Merino on 7/30/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet MKMapView *mapView;
    __weak IBOutlet UITextField *addressTextField;
    CLLocationCoordinate2D mapPointLocation;
}
- (IBAction)goToLocation:(id)sender;

@end

@implementation ViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        mapView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    mapPointLocation.latitude = 41.89385;
    mapPointLocation.longitude = -87.73534;
    //41.893732,-87.635322
    //41.89385,-87.73534
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapPointLocation, 2000, 2000);
    mapView.region = region;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToLocation:(id)sender {
    
    NSString *cleanString = [addressTextField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", cleanString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *resultsArray = [allDataDictionary objectForKey:@"results"];
        NSDictionary *zeroDictionary = [resultsArray objectAtIndex:0];
        NSDictionary *geometryDictionary = [zeroDictionary objectForKey:@"geometry"];
        NSDictionary *location = [geometryDictionary objectForKey:@"location"];
        
        mapPointLocation.latitude = [[location objectForKey:@"lat"] floatValue];
        mapPointLocation.longitude = [[location objectForKey:@"lng"] floatValue];

        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapPointLocation, 5000, 5000);
        mapView.region = region;
    }];
    [addressTextField resignFirstResponder];
}
@end
