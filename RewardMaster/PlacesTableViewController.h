//
//  PlacesTableViewController.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PlacesTableViewController : UITableViewController<CLLocationManagerDelegate>
{
    CLLocationManager *location;
    NSDictionary *places;
}

@property NSString *type;
@end
