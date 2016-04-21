//
//  SmallHeardView.m
//  fangbocun
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SmallHeardView.h"

@implementation SmallHeardView



-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.backgroundColor=[UIColor orangeColor];
        _titleLabel.text=@"楼盘列表";
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _titleLabel.font=[UIFont systemFontOfSize:15];
       
        
    }
    return _titleLabel;
}
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        self.titleLabel.frame=CGRectMake(10, 5, 60, frame.size.height-10);
        [self addSubview:self.titleLabel];
        
        NSArray * array=@[@"默认",@"价格",@"开盘",@"人气",@"筛选"];
      CGFloat width= ([UIScreen mainScreen].bounds.size.width-(self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width)-60)/5;
    

        for (int i=0; i<array.count; i++) {
            UIButton * button=[UIButton buttonWithType:UIButtonTypeSystem];
            button.frame=CGRectMake(self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width+10+i*(width+10), 5, width, frame.size.height-10);
            
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.layer.cornerRadius=5;
            button.layer.masksToBounds=YES;
            button.layer.borderColor=[UIColor lightGrayColor].CGColor;
            button.layer.borderWidth=1;
            button.backgroundColor=[UIColor clearColor];
//            button.tintColor=[UIColor orangeColor];
            button.titleLabel.font=[UIFont systemFontOfSize:15];
            if (0==i) {
                button.selected=YES;
                self.selectedBtn=button;
            }
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag=i;
            [self addSubview:button];
        }
        
       
        
        
        
    }
    return self;
}

-(void)buttonClick:(UIButton*)button
{
    
 
    self.selectedBtn.selected=NO;
    button.selected=YES;
    self.selectedBtn=button;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SmallButtonChange" object:nil userInfo:@{@"SmallButtonChange":@(button.tag)}];
    NSLog(@"%@",[button titleForState:UIControlStateNormal]);
}
@end
