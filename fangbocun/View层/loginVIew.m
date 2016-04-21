//
//  loginVIew.m
//  fangbocun
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "loginVIew.h"
#import "TestAndVerifyVIew.h"
@implementation loginVIew
#define top 10
#define left 10
#define right 10
#define hight 40
#define middle 5
-(id)initWithFrame:(CGRect)frame andTarger:(id)targer andSelector:(SEL)selector
{
    if (self=[super initWithFrame:frame]) {
        
        
        _userText=[[UITextField alloc]initWithFrame:CGRectMake(left, top, frame.size.width-2*left, hight)];
        _userText.placeholder=@"  请输入账号";
     
        
        _passWordText=[[UITextField alloc]initWithFrame:CGRectMake(left, hight+middle+top, frame.size.width-2*left, hight)];
        _passWordText.placeholder=@"  请输入密码";
        _textAndVierfyText=[[UITextField alloc]initWithFrame:CGRectMake(left, 2*hight+2*middle+top, frame.size.width/2-left, hight)];
        _textAndVierfyText.placeholder=@"  请输入验证码";
        
        
        _testImage=[[UIImageView alloc]initWithFrame:CGRectMake(self.textAndVierfyText.frame.origin.x+self.textAndVierfyText.frame.size.width, 2*hight+2*middle+top+5, 30, hight-10)];
        
        
        _testAndVerifyView=[[TestAndVerifyVIew alloc]initWithFrame:CGRectMake(frame.size.width/2+3*left,2*hight+2*middle+top, frame.size.width/2-4*left, hight)];
        
        
        _userText.layer.cornerRadius=10;
        _userText.layer.masksToBounds=YES
        ;
        _userText.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        _userText.layer.borderWidth=2;
        _passWordText.layer.cornerRadius=10;
        _passWordText.layer.masksToBounds=YES
        ;
        _passWordText.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        _passWordText.layer.borderWidth=2;
        
        _textAndVierfyText.layer.cornerRadius=10;
        _textAndVierfyText.layer.masksToBounds=YES
        ;
        _textAndVierfyText.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        _textAndVierfyText.layer.borderWidth=2;
        
        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame=CGRectMake(10, 3*hight+4*middle+top, frame.size.width-20, hight);
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.font=[UIFont systemFontOfSize:17];
        [_loginButton addTarget:targer action:selector forControlEvents:UIControlEventTouchUpInside];
        _loginButton.backgroundColor=[UIColor blueColor];
        
        _loginButton.layer.masksToBounds=YES;
        _loginButton.layer.cornerRadius=10;
        
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=10;
        
        [self addSubview:_userText];
        [self addSubview:_textAndVierfyText];
        [self addSubview:_passWordText];
        [self addSubview:_testAndVerifyView];
        [self addSubview:_loginButton];
        [self addSubview:_testImage];
        
        
        
        
    }
    return self;
}

@end
