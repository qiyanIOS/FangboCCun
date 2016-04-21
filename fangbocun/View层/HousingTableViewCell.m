//
//  HousingTableViewCell.m
//  fangbocun
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HousingTableViewCell.h"

@implementation HousingTableViewCell

-(void)setShouLabel:(UILabel *)ShouLabel

{
    ShouLabel.text=@"售出6套";;
    
    
    NSMutableAttributedString* contentStr=[[NSMutableAttributedString alloc]initWithString:ShouLabel.text];
    [contentStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(2, 1)];
   
    self.ShouLabel.attributedText=contentStr;
 
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
