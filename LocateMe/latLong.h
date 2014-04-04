//
//  latLong.h
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol latLongDelegate <NSObject>

@required
-(void) didUpdateToLocation:(CLLocation*)newLocation
               fromLocation:(CLLocation*)oldLocation;
@end


@interface latLong : NSObject
{
    CLLocationManager *locationManager;
}

@property(nonatomic,strong) id<latLongDelegate> delegate;

+(id)getSharedInstance;
-(void)startUpdating;
-(void) stopUpdating;


@end
