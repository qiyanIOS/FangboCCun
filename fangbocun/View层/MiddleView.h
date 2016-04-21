//
//  MiddleView.h
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleView : UIView
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UITableView*oneTableView;
@property(nonatomic,strong)UITableView*twoTableView;
@property(nonatomic,strong)UITableView*thridTableView;
@property(nonatomic,strong)UIButton* button;
-(id)initWithMiddleViewWithPoint:(CGPoint)point;
@end
