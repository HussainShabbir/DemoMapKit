//
//  CdMapViewAnnotation.h
//  CdMapView
//
//  Created by Hussain  on 29/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/mapKit.h>

@interface CdMapViewAnnotation : NSObject<MKAnnotation>
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *locationName;
@property (nonatomic,copy) NSString *discipline;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
-(id)initWithTitle: (NSString*)title  withLocationName: (NSString*)locationName withDiscipline: (NSString*)discipline withCoordinate: (CLLocationCoordinate2D)mapCoordinate;
-(MKMapItem *)mapItem;
@end
