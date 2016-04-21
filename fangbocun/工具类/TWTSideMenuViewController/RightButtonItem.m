//
//  RightButtonItem.m
//  fangbocun
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RightButtonItem.h"

@implementation RightButtonItem
+(id)rightItemImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectImageName andTarger:(id)targer andSelctor:(SEL)selctor
{
   UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
     button.frame=CGRectMake(0, 0,30, 40);
     [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
     [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateHighlighted];
    
     [button addTarget:targer action:selctor forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
}
@end
