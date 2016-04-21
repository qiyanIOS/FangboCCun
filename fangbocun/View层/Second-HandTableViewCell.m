//
//  Second-HandTableViewCell.m
//  fangbocun
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Second-HandTableViewCell.h"

@implementation Second_HandTableViewCell
//-(UIImageView*)TitleImage
//{
//    if (!_TitleImage) {
//        _TitleImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
//    }
//    return _TitleImage;
//}
//-(UIImageView*)oneSmallImage
//{
//    if (!_oneSmallImage) {
//        _oneSmallImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
//        
//    }
//    return _oneSmallImage;
//}
//-(UIImageView*)twoSmallImage
//{
//    if (!_twoSmallImage) {
//        _twoSmallImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
//    }
//    return _twoSmallImage;
//}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setLabels:(NSArray *)labels
{
    for (int i=0; i<labels.count; i++) {
        UILabel* label=  labels[i];
         label.layer.masksToBounds=YES;
        label.layer.cornerRadius=5;
        
       
    }
}
@end
