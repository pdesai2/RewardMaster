//
//  PlacesTableViewController.m
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "CreditCardTableViewController.h"
#import "CreditCard.h"
#import "Constants.h"

@interface PlacesTableViewController ()

@end

@implementation PlacesTableViewController
@synthesize type;
NSString *apiUrl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    location = [[CLLocationManager alloc] init];
    places = [[NSDictionary alloc] init];
    [self getPlaces];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)getPlaces
{
    location.delegate = self;
    location.desiredAccuracy = kCLLocationAccuracyBest;
    [location startUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    bool typeDefined = true;
    if(type == nil)
    {
        typeDefined = false;
    }
    [self getListOfPlaces:typeDefined withLatitude:[NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude] withLongitude:[NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude]];
}

-(void)getListOfPlaces:(BOOL)isTypeDefined withLatitude:(NSString*)latitude withLongitude:(NSString*)longitude
{
    NSURL *url = nil;
    if(isTypeDefined)
    {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=1000&type=%@&key=%@",latitude, longitude, type, API_KEY]];
     
    }
    else
    {
        NSString* types = @"grocery_or_supermarket|movie_theater|gas_station|transit_station|train_station|bus_station|subway_station|taxi_stand";
        NSString *tmp= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@ &radius=1000&type=%@&key=%@",latitude, longitude, types, API_KEY];
        url = [NSURL URLWithString:[tmp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ] ];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSString *append = @"{\"dataArray\":[";
    jsonString = [append stringByAppendingString:jsonString];
    jsonString = [jsonString stringByAppendingString:@"]}"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"}\n" withString:@"},"];
    NSData *json = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    places = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    if(self.searchString == nil)
    {
        [self getPlacesInArray];
    }
    else
    {
        [self filterPlacesWithString:self.searchString];
    }
    [self.tableView reloadData];
}

-(void) filterPlacesWithString:(NSString*)string
{
    NSMutableArray *searchStringArray = [[NSMutableArray alloc] init];
    NSArray *array = [places valueForKey:@"dataArray"];
    NSArray *results = [array valueForKey:@"results"];
    NSArray *temp = [results objectAtIndex:0];
    for(int i = 0 ; i < temp.count ; ++i)
    {
        NSString *name = [[temp objectAtIndex:i] valueForKey:@"name"];
        if([[name lowercaseString] isEqualToString:[string lowercaseString]])
        {
            [searchStringArray addObject:[temp objectAtIndex:i]];
        }
    }
    self.placesArray = [searchStringArray mutableCopy];
}

-(void) getPlacesInArray
{
    NSArray *array = [places valueForKey:@"dataArray"];
    NSArray *results = [array valueForKey:@"results"];
    self.placesArray = [results objectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.placesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [[self.placesArray objectAtIndex:indexPath.row] valueForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

-(NSArray *)getPlacesWithType:(NSString*)args
{
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dict = [self.placesArray objectAtIndex:indexPath.row];
    CreditCardTableViewController *viewController = [[CreditCardTableViewController alloc] init];
    if(self.type != nil)
    {
        viewController.tag = self.type;
    }
    else
    {
        viewController.tags = [dict objectForKey:@"types"];
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
