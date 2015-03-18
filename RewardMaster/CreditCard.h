//
//  CreditCard.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditCard : NSObject
{
    NSString *name;
    NSString *cashBackPercent;
    NSString *effective;
    NSArray *categories;
    NSString *otherInfo;
}

-(NSString*) getName;
-(NSString*) getCashBackPercent;
-(NSString*) getEffective;
-(NSString*) getOtherInfo;
-(NSArray*) getCategories;
@end
