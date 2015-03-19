//
//  CustomTableViewCell.h
//  RewardMaster
//
//  Created by Desai, Pratik on 3/18/15.
//  Copyright (c) 2015 intuit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *creditCardNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditCardCashBackLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditCardCategoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creditCardThumbnailView;

@end
