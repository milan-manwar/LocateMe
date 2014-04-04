//
//  ViewController.m
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = userLocation.coordinate;
    point.title = @"You are Located here";
    point.subtitle = @"powered by LocateMe";
    
    [self.mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
