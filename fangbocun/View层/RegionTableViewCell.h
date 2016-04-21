//
//  RegionTableViewCell.h
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "regionData.h"

@interface RegionTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton* RegionButton;
@property(nonatomic,strong)UIButton* selectedBtn;
@property(nonatomic,strong)regionData* region;


@end
