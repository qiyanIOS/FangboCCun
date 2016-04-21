//
//  MyTabBarViewController.m
//  fangbocun
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyTabBarViewController.h"


#import "AppDelegate.h"
@interface MyTabBarViewController ()<UITabBarControllerDelegate,UIApplicationDelegate>
@property(nonatomic,strong)UIButton* selectedBtn;

@property(nonatomic,strong)UIImageView* imageView;
@property(nonatomic,strong)UIButton* btn;
@end

@implementation MyTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect=self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    self.myView=[[UIView alloc]init];
    self.myView.frame=rect;
   // self.myView.backgroundColor=[UIColor colorWithRed:0.34 green:0.657 blue:0.315 alpha:1.000];
    UIImageView* imageView=[[UIImageView alloc]init];
    imageView.image=[UIImage imageNamed:@"ToolViewBkg_Black"];
    imageView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.myView.frame.size.height);
    [self.myView addSubview:imageView];
    
   

    
    [self.view addSubview:self.myView];
    NSArray* array=@[@"首页",@"新房",@"二手",@"出租",@"资讯",@"我的",];
    for (int i=0; i<array.count; i++) {
        _btn=[[UIButton alloc]init];
        [_btn setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
       [_btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateSelected];
        _btn.imageEdgeInsets=UIEdgeInsetsMake(0,7, 0, 7);

       
        CGFloat x=(self.myView.frame.size.width-70)/6;
        _btn.frame=CGRectMake(10+i*(x+10), 0, x, self.myView.frame.size.height-15);
        [self.myView addSubview:_btn];
        _btn.tag=i;
        [_btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        if (0==i) {
            _btn.selected=YES;
            self.selectedBtn=_btn;
        }
        
        UILabel* titleLabel=[[UILabel alloc]init];
        titleLabel.frame=CGRectMake(10+i*(x+10), _btn.frame.size.height, x, self.myView.frame.size.height-_btn.frame.size.height);
        
        titleLabel.text=array[i];
        titleLabel.textAlignment=NSTextAlignmentCenter;
        
        titleLabel.textColor=[UIColor blackColor];
        titleLabel.font=[UIFont boldSystemFontOfSize:14];
        [imageView addSubview:titleLabel];
        
        
    }
    
}
-(void)clickBtn:(UIButton*)button
{
    self.selectedBtn.selected=NO;
    button.selected=YES;
    self.selectedBtn=button;
    self.selectedIndex=button.tag;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"buttonLight" object:nil userInfo:@{@"buttonLight":@(button.tag),@"selectedBtn":self.selectedBtn}];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.myView.hidden=NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.myView.hidden=YES;
}


@end
