//
//  CreditCard.m
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import "CreditCard.h"

@implementation CreditCard

@synthesize cashBackPercent;

-(id)initWithName:(NSString*)name
{
    self.name = name;
    self.categories = [[NSMutableDictionary alloc] init];
    return self;
}

-(NSString*) getName
{
    return self.name;
}
-(NSString*) getCashBackPercent
{
    return self.cashBackPercent;
}
-(NSString*) getEffective
{
    return self.getEffective;
}
-(NSString*) getOtherInfo
{
    return self.otherInfo;
}
-(NSMutableDictionary*) getCategories
{
    return self.categories;
}

-(void) addCategory:(NSString*)category withPercent:(NSString*)percent
{
    [self.categories setObject:percent forKey:category];
}

@end
