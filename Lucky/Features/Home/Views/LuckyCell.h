//
//  LuckyCell.h
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LuckyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *luckyLabel1;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel2;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel3;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel4;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel5;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel6;
@property (weak, nonatomic) IBOutlet UILabel *luckyLabel7;

@property (strong, nonatomic) NSMutableArray *ballArr;

@end

NS_ASSUME_NONNULL_END
