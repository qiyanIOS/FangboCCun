//
//  detailsViewController.m
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "detailsViewController.h"

@interface detailsViewController ()

@end

@implementation detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    
    UILabel* label=[[UILabel alloc]init];
    
    label.frame=CGRectMake(0, 0, 50, 300);
    label.center=CGPointMake(self.view.center.x, self.view.center.y);
    label.text=@"让数据飞一会";
    label.numberOfLines=0;
    label.font=[UIFont boldSystemFontOfSize:40];
    self.view.backgroundColor=[UIColor brownColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=YES;
    
}

@end
