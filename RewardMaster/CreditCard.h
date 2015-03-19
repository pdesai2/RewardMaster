//
//  CreditCard.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditCard : NSObject

    @property NSString *name;
    @property NSString *cashBackPercent;
    @property NSString *effective;
    @property NSMutableDictionary *categories;
    @property NSString *otherInfo;

-(id)initWithName:(NSString*)name;
-(NSString*) getName;
-(NSString*) getCashBackPercent;
-(NSString*) getEffective;
-(NSString*) getOtherInfo;
-(NSMutableDictionary*) getCategories;
-(void) addCategory:(NSString*)category withPercent:(NSString*)percent;
@end
