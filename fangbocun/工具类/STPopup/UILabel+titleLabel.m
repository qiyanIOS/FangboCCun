//
//  UILabel+titleLabel.m
//  fangbocun
//
//  Created by apple on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "UILabel+titleLabel.h"

@implementation UILabel (titleLabel)
+(UILabel*)labelTextWithString:(NSString *)textStr
{
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:17];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=textStr;
    return label;
}
@end
