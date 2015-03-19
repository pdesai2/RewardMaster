//
//  Cards.m
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import "Cards.h"
#import "CreditCard.h"

@implementation Cards

//TODO : WHY ISNT FILE READING WORKING ????

NSString *calenderFile =  @"card_name,rate,january_bank,january_google,february_bank,february_google,march_bank,march_google,april_bank,april_google,may_bank,may_google,june_bank,june_google\nFreedom,5%,Grocery Stores(Exluding Walmart & Target),grocery_or_supermarket,Grocery Stores(Exluding Walmart & Target),grocery_or_supermarket,Grocery Stores(Exluding Walmart & Target),grocery_or_supermarket,Restaurants,restaurant,Restaurants,restaurant,Restaurants,restaurant\nFreedom,5%,Movie Theatres,movie_theater,Movie Theatres,movie_theater,Movie Theatres,movie_theater,Bed Bath & Beyond,Bed Bath & Beyond,Bed Bath & Beyond,Bed Bath & Beyond,Bed Bath & Beyond,Bed Bath & Beyond\nFreedom,5%,Starbucks,Starbucks,Starbucks,Starbucks,Starbucks,Starbucks,H&M,H&M,H&M,H&M,H&M,H&M\nFreedom,5%,,,,,,,Overstock.com,Overstock.com,Overstock.com,Overstock.com,Overstock.com,Overstock.com\nFreedom,1%,others,,others,,others,,others,,others,,others,\nFreedom,1%,Walmart,,Walmart,,Walmart,,,,,,,\nFreedom,1%,Target,,Target,,Target,,,,,,,\nDiscover,5%,Gas Station,gas_station,Gas Station,gas_station,Gas Station,gas_station,Restaurants,restaurant,Restaurants,restaurant,Restaurants,restaurant\nDiscover,5%,Ground Transportation,transit_station,Ground Transportation,transit_station,Ground Transportation,transit_station,Movies,movie_theater,Movies,movie_theater,Movies,movie_theater\nDiscover,5%,Ground Transportation,train_station,Ground Transportation,train_station,Ground Transportation,train_station,,,,,,\nDiscover,5%,Ground Transportation,bus_station,Ground Transportation,bus_station,Ground Transportation,bus_station,,,,,,\nDiscover,5%,Ground Transportation,subway_station,Ground Transportation,subway_station,Ground Transportation,subway_station,,,,,,\nDiscover,5%,Ground Transportation,taxi_stand,Ground Transportation,taxi_stand,Ground Transportation,taxi_stand,,,,,,\nDiscover,1%,others,,others,,others,,others,,others,,others,\nCiti  Double Cash Card,2%,all,,all,,all,,all,,all,,all,\nBOA Cash Rewards,3%,Grocery,grocery_or_supermarket,Grocery,grocery_or_supermarket,Grocery,grocery_or_supermarket,Grocery,grocery_or_supermarket,Grocery,grocery_or_supermarket,Grocery,grocery_or_supermarket\nBOA Cash Rewards,2%,gas station,gas_station,gas station,gas_station,gas station,gas_station,gas station,gas_station,gas station,gas_station,gas station,gas_station\nBOA Cash Rewards,1%,others,,others,,others,,others,,others,,others,"
;

static Cards *shared;

+(Cards*)shared
{
    if(!shared)
    {
        shared = [[Cards alloc]init];
    }
    return shared;
}

-(id)init
{
    self.cards = [[NSMutableArray alloc] init];
    return self;
}

-(void)addCardsToStore:(NSString*)fileName
{
    NSArray *lines = [calenderFile componentsSeparatedByString:@"\n"];
    NSString *currentBank;
    CreditCard *currentCard = nil;
    for(int i = 1 ; i < lines.count ; ++i)
    {
        NSArray *parts = [[lines objectAtIndex:i] componentsSeparatedByString:@","];
        if(currentCard == nil)
        {
            currentCard = [[CreditCard alloc] initWithName:parts[0]];
        }
        if(currentBank == nil)
        {
            currentBank = [parts objectAtIndex:0];
        }
        if([currentBank isEqual:[parts objectAtIndex:0]])
        {
            [currentCard addCategory:parts[7] withPercent:parts[1]];
        }
        else
        {
            currentBank = [parts objectAtIndex:0];
            [self.cards addObject:currentCard];
            currentCard = [[CreditCard alloc] initWithName:parts[0]];
            [currentCard addCategory:parts[7] withPercent:parts[1]];
        }
    }
    [self.cards addObject:currentCard];
    NSLog(@"done");
}




@end
