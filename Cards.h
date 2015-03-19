//
//  Cards.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject
-(void)addCardsToStore:(NSString*)fileName;
+(Cards *)shared;
@property NSMutableArray *cards;
@end
