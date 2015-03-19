//
//  LaunchViewController.m
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import "LaunchViewController.h"
#import "PlacesTableViewController.h"
#import "Cards.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)populateCreditCardInfo
{
    
}

- (IBAction)ListPlacesButton:(id)sender {
    PlacesTableViewController *viewController = [[PlacesTableViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:true];
}

- (IBAction)SearchMerchantButton:(id)sender {
    if([self.searchInputTextField.text  isEqual: @""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No search string specified"
                                                        message:@"You must specify a valid string to search !."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [[Cards shared] addCardsToStore:@"calender.csv"];
    }
}

- (IBAction)RestaurantSearchButton:(id)sender {
    PlacesTableViewController *viewController = [[PlacesTableViewController alloc] init];
    viewController.type = @"restaurant";
    [self.navigationController pushViewController:viewController animated:true];
}

- (IBAction)SuperMarketSearchButton:(id)sender {
    PlacesTableViewController *viewController = [[PlacesTableViewController alloc] init];
    viewController.type = @"grocery_or_supermarket";
    [self.navigationController pushViewController:viewController animated:true];
}

- (IBAction)TheatreSearchButton:(id)sender {
    PlacesTableViewController *viewController = [[PlacesTableViewController alloc] init];
    viewController.type = @"movie_theater";
    [self.navigationController pushViewController:viewController animated:true];
}
- (IBAction)GasStationSearchButton:(id)sender {
    PlacesTableViewController *viewController = [[PlacesTableViewController alloc] init];
    viewController.type = @"gas_station";
    [self.navigationController pushViewController:viewController animated:true];
}
@end
