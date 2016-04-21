//
//  NagationButtonTableViewCell.m
//  fangbocun
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "NagationButtonTableViewCell.h"

@implementation NagationButtonTableViewCell

-(void)setRegion:(NagationButtonData *)region
{
    _region=region;
    CGFloat width=([UIScreen mainScreen].bounds.size.width-40)/5;
    
    for (int i=0; i<region.buttonDataArray.count; i++) {
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i%5*(width+5),i/5*25, width, 20);
        [button setTitle:region.buttonDataArray[i] forState:UIControlStateNormal];
        button.backgroundColor=[UIColor grayColor];
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        button.backgroundColor=[UIColor clearColor];
        button.layer.masksToBounds=YES;
        button.layer.cornerRadius=5;
        button.layer.borderColor=[UIColor lightGrayColor].CGColor;
        button.layer.borderWidth=1;
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
