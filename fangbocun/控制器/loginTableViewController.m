//
//  loginTableViewController.m
//  fangbocun
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "loginTableViewController.h"
#import "STPopup.h"
#import "PopViewController.h"
#import "UILabel+titleLabel.h"


@interface loginTableViewController ()


@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;

@property (weak, nonatomic) IBOutlet UIButton *mvpButton;
@property (weak, nonatomic) IBOutlet UIButton *secondHandButton;
@property (weak, nonatomic) IBOutlet UIButton *rentButton;

@end

@implementation loginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    UILabel* label=[UILabel labelTextWithString:@"我的"];
    self.navigationItem.titleView=label;
    
    [self initButtonLayer];
   
}
-(void)initButtonLayer
{
    self.loginButton.layer.cornerRadius=5;
    self.forgetButton.layer.cornerRadius=5;
    self.mvpButton.layer.cornerRadius=5;
    self.secondHandButton.layer.cornerRadius=5;
    self.rentButton.layer.cornerRadius=5;
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSArray* array=self.tabBarController.view.subviews;
//    UIView* view=array[1];
//    view.hidden=YES;
//    
//}

- (IBAction)loginButton:(id)sender {

    
  

    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:[PopViewController new]];
    popupController.cornerRadius = 4;
    popupController.transitionStyle = STPopupTransitionStyleFade;
    [popupController presentInViewController:self];

  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSArray* array=self.tabBarController.view.subviews;
//    
//    UIView* view=array[1];
//    view.hidden=YES;
//    
//}

#pragma mark - Table view data source

@end
