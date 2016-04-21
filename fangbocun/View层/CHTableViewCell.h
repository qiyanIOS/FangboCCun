//
//  CHTableViewCell.h
//  fangbocun
//
//  Created by apple on 15/11/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "regionData.h"
@interface CHTableViewCell : UITableViewCell
@property(nonatomic,strong)regionData* region;
@property(nonatomic,strong)UIButton* selectedButton;
@end
