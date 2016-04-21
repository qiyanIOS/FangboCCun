//
//  loginVIew.h
//  fangbocun
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestAndVerifyVIew.h"
@interface loginVIew : UIView
@property(nonatomic,strong)UITextField* userText;
@property(nonatomic,strong)UITextField* passWordText;
@property(nonatomic,strong)UITextField* textAndVierfyText;
@property(nonatomic,strong)UIButton* loginButton;
@property(nonatomic,strong)TestAndVerifyVIew*testAndVerifyView;
@property(nonatomic,strong)UIImageView* testImage;
-(id)initWithFrame:(CGRect)frame andTarger:(id)targer andSelector:(SEL)selector;
@end
