//
//  CHTableViewCell.m
//  fangbocun
//
//  Created by apple on 15/11/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CHTableViewCell.h"
#import "TWTSideMenuViewController.h"
@implementation CHTableViewCell

- (void)awakeFromNib {
   
    
    
}
-(void)setRegion:(regionData *)region
{
    
    CGFloat startX=10;
    CGFloat startY=20;
    CGFloat  totalWidth=250;
    CGFloat buttonHeight=20;
    
    
  
        for (int i=0; i<region.regionArray.count; i++) {
            UIButton* titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
            [titleButton setTitle:region.regionArray[i] forState:UIControlStateNormal];
            titleButton.layer.cornerRadius=4.0;
            [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            
          
            
            
            titleButton.titleLabel.font=[UIFont systemFontOfSize:14];
            titleButton.tag=i;
            [titleButton addTarget:self action:@selector(regionButton:) forControlEvents:UIControlEventTouchUpInside];
            
           
            
            NSDictionary* attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
            
            CGFloat computeWidth=[region.regionArray[i] boundingRectWithSize:CGSizeMake(totalWidth, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil ].size.width;
            
            if (startX+computeWidth+20 >= totalWidth) {
                startX=10;
                startY+=(buttonHeight+10);
                
            }
            titleButton.frame=CGRectMake(startX, startY, computeWidth+10, buttonHeight);
            
            startX=titleButton.frame.size.width+5+titleButton.frame.origin.x;
            
            
            [self.contentView addSubview:titleButton];
            
        }
        
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, startY+buttonHeight+10);
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.backgroundColor=[UIColor blackColor];

    
    }
-(void)regionButton:(UIButton*)button
{
    if (_selectedButton) {
        _selectedButton.selected=NO;
    }
    button.selected=YES;
    _selectedButton=button;
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sliderButton" object:nil userInfo:@{@"sliderButton":button}];
}

@end
