//
//  latLongVIewControllerViewController.m
//  LocateMe
//
//  Created by Omnipresent on 26/03/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import "latLongVIewControllerViewController.h"
#import "DataClass.h"

@interface latLongVIewControllerViewController ()

@end

@implementation latLongVIewControllerViewController
@synthesize tblViewObj;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    
//    int i = [arrMutableData count] - 1;
//    DataClass *dcObj = [arrMutableData objectAtIndex:i];
//    
//    NSLog(@"From array: %@",dcObj.strLatitude);
//    NSLog(@"From array: %@", dcObj.strLongitude);
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrMutableData = [[NSMutableArray alloc]init];
    [[latLong getSharedInstance]setDelegate:self];
    [[latLong getSharedInstance]startUpdating];
    [tblViewObj reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didUpdateToLocation:(CLLocation *)newLocation
              fromLocation:(CLLocation *)oldLocation{
    [latitudeLabel setText:[NSString stringWithFormat:
                            @"%f",newLocation.coordinate.latitude]];
    [longitudeLabel setText:[NSString stringWithFormat:
                             @"%f",newLocation.coordinate.longitude]];
    
    DataClass *dcObj = [[DataClass alloc]init];
    
    dcObj.strLatitude =[NSString stringWithFormat:
                        @"%f",newLocation.coordinate.latitude];
    dcObj.strLongitude = [NSString stringWithFormat:
                         @"%f",newLocation.coordinate.longitude];
    
    NSLog(@"Latitude: %@",dcObj.strLatitude);
    NSLog(@"Longitude: %@",dcObj.strLongitude);
    
    [arrMutableData addObject:dcObj];
    [tblViewObj reloadData];
    
    
}

#pragma - mark TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrMutableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tblViewObj dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    DataClass *dcObj = [arrMutableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Lt: %@ Ln: %@",dcObj.strLatitude, dcObj.strLongitude];
    NSLog(@"%@",[NSString stringWithFormat:@"Lt: %@ Ln: %@",dcObj.strLatitude, dcObj.strLongitude]);
    return cell;
}


@end
