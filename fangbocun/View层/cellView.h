//
//  cellView.h
//  fangbocun
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellView : UIView
@property(nonatomic,strong)NSString* titleName;
-(id)initWithFrame:(CGRect)frame andName:(NSString*)name;
@end
