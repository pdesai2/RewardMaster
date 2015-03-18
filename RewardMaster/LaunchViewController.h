//
//  LaunchViewController.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchViewController : UIViewController
- (IBAction)ListPlacesButton:(id)sender;
- (IBAction)SearchMerchantButton:(id)sender;
- (IBAction)RestaurantSearchButton:(id)sender;
- (IBAction)SuperMarketSearchButton:(id)sender;
- (IBAction)TheatreSearchButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchInputTextField;
- (IBAction)GasStationSearchButton:(id)sender;

@end
