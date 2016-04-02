//
//  DetailViewController.h
//  CdMapView
//
//  Created by Hussain  on 29/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/mapKit.h>

@interface DetailViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak,nonatomic) IBOutlet MKMapView *mapView;

@end

