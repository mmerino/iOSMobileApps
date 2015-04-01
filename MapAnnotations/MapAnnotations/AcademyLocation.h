//
//  AcademyLocation.h
//  MapAnnotations
//
//  Created by Maria Merino on 7/30/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AcademyLocation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
