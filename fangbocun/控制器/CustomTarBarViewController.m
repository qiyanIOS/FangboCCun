//
//  CustomTarBarViewController.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CustomTarBarViewController.h"

@interface CustomTarBarViewController ()



@end

@implementation CustomTarBarViewController


//-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        _selectedindex=-1;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedindex=-1;
//    _nomallmageArray=[[NSArray alloc]initWithObjects:@"",@"", nil];
//    _hightlightedImageArray=[[NSArray alloc]initWithObjects:@"",@"", nil];
    
    if (_selectedindex==-1) {
        self.selectedindex=0;
    }
    
}

    

-(void)setSelectedindex:(NSInteger)selectedindex
{
    if (selectedindex==_selectedindex) {
       
            return;
        }
        
        if (self.selectedindex>=0) {
            UIViewController*previousViewController=[_viewControlls objectAtIndex:_selectedindex];
           [previousViewController.view removeFromSuperview];
            
            UIButton*previousButton=(UIButton*)[self.view viewWithTag:_selectedindex+1];
            [previousButton setBackgroundImage:[UIImage imageNamed:[_nomallmageArray objectAtIndex:_selectedindex]] forState:UIControlStateNormal];
            
        
        
        
        
    }
    _selectedindex=selectedindex;
    UIViewController*currentViewController=[_viewControlls objectAtIndex:_selectedindex];
    UIButton* currentButton=(UIButton*)[self.view viewWithTag:_selectedindex+1];
    [currentButton setBackgroundImage:[UIImage imageNamed:[_hightlightedImageArray objectAtIndex:_selectedindex]] forState:UIControlStateNormal];
    
    if ([currentViewController isKindOfClass:[UINavigationController class]]) {
        ((UINavigationController*)currentViewController).delegate=self;
        
    }
    currentViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44);
    [self.view addSubview:currentViewController.view];
    [self.view sendSubviewToBack:currentViewController.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



- (IBAction)click:(UIButton*)sender {
    self.selectedindex=sender.tag-1;
//    NSLog(@"%d",sender.tag-1);
}
-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    self.tabBarView.hidden = hidesBottomBarWhenPushed;
}

@end
