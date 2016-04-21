//
//  RightButtonItem.h
//  fangbocun
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightButtonItem : UIBarButtonItem
@property(nonatomic,strong)UIButton* button;
+(id)rightItemImageName:(NSString*)imageName andSelectedImageName:(NSString*)selectImageName andTarger:(id)targer andSelctor:(SEL)selctor;
@end
