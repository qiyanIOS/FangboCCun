//
//  RegionTableViewCell.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RegionTableViewCell.h"

@implementation RegionTableViewCell

- (void)awakeFromNib {
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setRegion:(regionData *)region
{
    
    _region=region;
    
    CGFloat startX=110;
    CGFloat startY=5;
    CGFloat  totalWidth=[UIScreen mainScreen].bounds.size.width-_RegionButton.frame.size.width;
    CGFloat buttonHeight=20;
    
   
    
        _RegionButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _RegionButton.frame=CGRectMake(5, 0, 80, 40);
        [_RegionButton setTitle:region.title forState:UIControlStateNormal];
        [_RegionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _RegionButton.layer.cornerRadius=5.0;
 
        [_RegionButton addTarget:self action:@selector(clickRegionButton:) forControlEvents:UIControlEventTouchUpInside];
        _RegionButton.backgroundColor=[UIColor orangeColor];
        [self.contentView addSubview:_RegionButton];
    
      
        

        for (int i=0; i<region.regionArray.count; i++) {
            UIButton* titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
            [titleButton setTitle:region.regionArray[i] forState:UIControlStateNormal];
            titleButton.layer.cornerRadius=4.0;
            [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [titleButton setTitleColor:[UIColor orangeColor]
                              forState:UIControlStateSelected];
      
            
            
            titleButton.titleLabel.font=[UIFont boldSystemFontOfSize:15];
            titleButton.tag=i;
            [titleButton addTarget:self action:@selector(regionButton:) forControlEvents:UIControlEventTouchUpInside];
            

            
            NSDictionary* attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
            
            CGFloat computeWidth=[region.regionArray[i] boundingRectWithSize:CGSizeMake(totalWidth, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil ].size.width;
            
            if (startX+computeWidth+20 >= totalWidth) {
                startX=110;
                startY+=(buttonHeight+10);
               
            }
            titleButton.frame=CGRectMake(startX, startY, computeWidth+10, buttonHeight);
            
            startX=titleButton.frame.size.width+5+titleButton.frame.origin.x;
            
            
         [self.contentView addSubview:titleButton];
           
        }
        
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, startY+buttonHeight+10);
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    
  
    
  
}

-(void)clickRegionButton:(UIButton*)button
{
   

  

}
-(void)regionButton:(UIButton*)button
{
    if (_selectedBtn) {
        _selectedBtn.selected=NO;
    }
    button.selected=YES;
    _selectedBtn=button;
    
    NSLog(@"%@",[button titleForState:UIControlStateNormal]);
}

@end
