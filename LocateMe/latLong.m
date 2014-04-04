//
//  latLong.m
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import "latLong.h"
static latLong *DefaultManager = Nil;

@interface latLong()

-(void)initiate;

@end

@implementation latLong


+(id)getSharedInstance{
    if (!DefaultManager) {
        DefaultManager = [[self allocWithZone:NULL]init];
        [DefaultManager initiate];
    }
    return DefaultManager;
}
-(void)initiate{
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
}

-(void)startUpdating{
    [locationManager startUpdatingLocation];
}

-(void) stopUpdating{
    [locationManager stopUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:
(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    if ([self.delegate respondsToSelector:@selector
         (didUpdateToLocation:fromLocation:)])
    {
        [self.delegate didUpdateToLocation:oldLocation
                              fromLocation:newLocation];
        
    }
}

@end
