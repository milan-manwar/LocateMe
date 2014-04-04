//
//  ViewController.h
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
