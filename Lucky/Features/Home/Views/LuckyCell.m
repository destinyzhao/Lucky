//
//  LuckyCell.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "LuckyCell.h"

@implementation LuckyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setubLuckyView];
}

- (void)setubLuckyView
{
    self.luckyLabel1.layer.masksToBounds = YES;
    self.luckyLabel1.layer.cornerRadius = 19;
    self.luckyLabel1.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel1.layer.borderWidth = 1;
    
    self.luckyLabel2.layer.masksToBounds = YES;
    self.luckyLabel2.layer.cornerRadius = 19;
    self.luckyLabel2.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel2.layer.borderWidth = 1;
    
    self.luckyLabel3.layer.masksToBounds = YES;
    self.luckyLabel3.layer.cornerRadius = 19;
    self.luckyLabel3.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel3.layer.borderWidth = 1;
    
    self.luckyLabel4.layer.masksToBounds = YES;
    self.luckyLabel4.layer.cornerRadius = 19;
    self.luckyLabel4.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel4.layer.borderWidth = 1;
    
    self.luckyLabel5.layer.masksToBounds = YES;
    self.luckyLabel5.layer.cornerRadius = 19;
    self.luckyLabel5.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel5.layer.borderWidth = 1;
    
    self.luckyLabel6.layer.masksToBounds = YES;
    self.luckyLabel6.layer.cornerRadius = 19;
    self.luckyLabel6.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel6.layer.borderWidth = 1;
    
    self.luckyLabel7.layer.masksToBounds = YES;
    self.luckyLabel7.layer.cornerRadius = 19;
    self.luckyLabel7.layer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:8.8].CGColor;
    self.luckyLabel7.layer.borderWidth = 1;
}

- (void)setBallArr:(NSMutableArray *)ballArr
{
    if (ballArr.count) {
        self.luckyLabel1.text = ballArr[0];
        self.luckyLabel2.text = ballArr[1];
        self.luckyLabel3.text = ballArr[2];
        self.luckyLabel4.text = ballArr[3];
        self.luckyLabel5.text = ballArr[4];
        self.luckyLabel6.text = ballArr[5];
        self.luckyLabel7.text = ballArr[6];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
