//
//  latLongVIewControllerViewController.h
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "latLong.h"

@interface latLongVIewControllerViewController : UIViewController <latLongDelegate>
{
    IBOutlet UILabel *latitudeLabel;
    IBOutlet UILabel *longitudeLabel;
    UITableView *tblViewObj;
    NSMutableArray *arrMutableData;
}

@property (strong, nonatomic) IBOutlet UITableView *tblViewObj;
@end
