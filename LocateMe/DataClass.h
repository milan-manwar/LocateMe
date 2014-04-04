//
//  DataClass.h
//  LocateMe
//
//  Created by Omnipresent on 03/04/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject
{
    NSString *strLatitude;
    NSString *strLongitude;
}

@property (strong, nonatomic) NSString *strLatitude;
@property (strong, nonatomic) NSString *strLongitude;

@end
