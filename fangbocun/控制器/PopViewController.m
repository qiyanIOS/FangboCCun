//
//  PopViewController.m
//  fangbocun
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PopViewController.h"
#import "STPopup.h"
#import "loginVIew.h"
#import "TestAndVerifyVIew.h"

@interface PopViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)loginVIew*login;




@end

@implementation PopViewController
- (instancetype)init
{
    if (self = [super init]) {
       
        self.contentSizeInPopup = CGSizeMake(self.view.frame.size.width-20, 200);
        self.landscapeContentSizeInPopup = CGSizeMake(400, 200);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _login=[[loginVIew alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height) andTarger:self andSelector:@selector(onClick)];
    _login.textAndVierfyText.delegate=self;
    [self.view addSubview:_login];
    

    
    
}
-(void)onClick
{

    
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"....." delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];

   
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([_login.textAndVierfyText.text isEqualToString:_login.testAndVerifyView.TestAndVerifyStr]) {
        _login.testImage.image=[UIImage imageNamed:@"qq"];
        
    }else
    {
         _login.testImage.image=[UIImage imageNamed:@"xx"];
        CAKeyframeAnimation* anmo=[CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        anmo.repeatCount=2;
        anmo.values=@[@(-20),@(20),@(-20)];
        [_login.textAndVierfyText.layer addAnimation:anmo forKey:nil];
        [_login.testAndVerifyView method];
        [_login.testAndVerifyView setNeedsDisplay];
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=YES;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    UIView* view=array[1];
    view.hidden=YES;
}
@end
