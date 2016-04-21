//
//  heardView.m
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "heardView.h"

@implementation heardView
#define LIFT 10
#define MIDDLE 20
#define RIGHT 10
#define TOP   10


-(id)init
{
    if (self=[super init]) {
     
        double width=([UIScreen mainScreen].bounds.size.width-2*LIFT-3*MIDDLE)/4;
    
        NSArray* array=@[@"新房",@"看房团",@"二手房",@"租房",@"资讯",@"小区",@"地图",@"计算器"];
        
        for (int i=0; i<array.count; i++) {
            self.button=[UIButton buttonWithType:UIButtonTypeSystem];
            self.button.tag=i;
            
//            [self.button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            self.button.backgroundColor=[UIColor grayColor];
            self.button.frame=CGRectMake(LIFT+i%4*(width+MIDDLE),TOP +i/4*(width+2*MIDDLE), width, width) ;
            [self addSubview:self.button];
            self.button.layer.cornerRadius=width/2;
            [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
           
            
            self.label=[[UILabel alloc]init];
            self.label.text=array[i];
            self.label.font=[UIFont boldSystemFontOfSize:17];
            self.label.frame=CGRectMake(LIFT+i%4*(width+MIDDLE), TOP+i/4*(width+2*MIDDLE)+width+5, width, 30);
            self.label.textAlignment=NSTextAlignmentCenter;
            [self addSubview:self.label];
            
        }
        
        CGRect rect=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TOP+2*self.button.frame.size.height+4*MIDDLE+20+60);
        
        self.frame=rect;
       
        self.imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cc.png"]];
       self.imageView.frame=CGRectMake(0, self.frame.size.height-60,self.frame.size.width, 60);
        self.imageView.backgroundColor=[UIColor brownColor];
        [self addSubview:self.imageView];
      
        
    }
  
    
    
    
    return self;
}
-(void)click:(UIButton*)button



{
    
    
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"buttonClick" object:nil userInfo:@{@"buttonClick":@(button.tag)}];
    
    
}
@end
