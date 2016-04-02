//
//  DetailViewController.m
//  CdMapView
//
//  Created by Hussain  on 29/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import "DetailViewController.h"
#import "CdMapViewAnnotation.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.detailItem) {
        [self centerMapOnLocation:[[CLLocation alloc]initWithLatitude:[[self.detailItem valueForKey:@"latitude"]doubleValue] longitude:[[self.detailItem valueForKey:@"longitude"]doubleValue]]];
        NSString *title = [[self.detailItem valueForKey:@"title"] description];
        NSString *locationName = [[self.detailItem valueForKey:@"locationName"] description];
        NSString *discipline = [[self.detailItem valueForKey:@"discipline"] description];
        CLLocationCoordinate2D mapCoordinate = CLLocationCoordinate2DMake([[self.detailItem valueForKey:@"latitude"]doubleValue], [[self.detailItem valueForKey:@"longitude"]doubleValue]);
        CdMapViewAnnotation *annotation = [[CdMapViewAnnotation alloc]initWithTitle:title withLocationName:locationName withDiscipline:discipline withCoordinate:mapCoordinate];
            [self.mapView addAnnotation:annotation];
    }
}

-(void)centerMapOnLocation:(CLLocation*)location{
    CLLocationDistance regionRadius = 1000;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0);
    [self.mapView setRegion:region];
}

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    NSString *identifier = @"Pin";
    MKPinAnnotationView * pinView;
    pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (pinView != nil){
        pinView.annotation = annotation;
    }
    else{
        pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        pinView.canShowCallout = YES;
        pinView.calloutOffset = CGPointMake(-5,  5);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = btn;
    }
    return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    id location = view.annotation;
    [[location mapItem]openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
