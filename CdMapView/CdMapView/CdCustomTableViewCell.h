//
//  CdCustomTableViewCell.h
//  CdMapView
//
//  Created by Hussain  on 29/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CdCustomTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel* locationName;
@property (nonatomic,weak) IBOutlet UILabel* titleOfThing;
@property (nonatomic,weak) IBOutlet UILabel* discipline;
@property (nonatomic,weak) IBOutlet UILabel* latitude;
@property (nonatomic,weak) IBOutlet UILabel* longitude;
@end
