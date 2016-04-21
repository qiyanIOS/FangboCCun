//
//  MoreView.m
//  fangbocun
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MoreView.h"
#import "NagationButtonData.h"
#import "NagationButtonTableViewCell.h"
@interface MoreView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray* buttonDataArray;
@end

@implementation MoreView
-(NSArray*)buttonDataArray
{
    if (!_buttonDataArray) {
        _buttonDataArray=[NagationButtonData buttonDataArray];
    }
    return _buttonDataArray;
}
static MoreView * _moreView=nil;
+(MoreView*)sharedView
{
    if (!_moreView) {
        
    
    _moreView=[[MoreView alloc]init ];
               _moreView.frame=CGRectMake(10, -200, [UIScreen mainScreen].bounds.size.width-20, 200);
    
    _moreView.layer.cornerRadius=10;
    _moreView.backgroundColor=[UIColor grayColor];
        _moreView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        _moreView.layer.borderWidth=1;
        _moreView.layer.masksToBounds=YES;
        [_moreView getTableView];
       
        
        
   
    
    
    
    }
    return _moreView;
}
-(void)getTableView
{
    NSLog(@"tableView");
    UITableView* tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, _moreView.frame.size.width, _moreView.frame.size.height) style:UITableViewStyleGrouped];
    UIImageView* backImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbarViewBack"]];
    [tableView setBackgroundView:backImage];
   
    tableView.scrollEnabled=NO;
    
    tableView.delegate=self;
    tableView.dataSource=self;
    
        
        [_moreView addSubview:tableView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.buttonDataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NagationButtonTableViewCell* cell=[[NagationButtonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
   
    cell.selectionStyle=  UITableViewCellSelectionStyleNone;
    
    NagationButtonData* data=self.buttonDataArray[indexPath.section];
    cell.region=data;
    if (indexPath.section==1) {
        UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        NSArray* buttonArray=@[@"购房工具",@"新房地图",@"二手找房",@"租房找房"];
        CGFloat width=([UIScreen mainScreen].bounds.size.width-25)/2;
        for (int i=0; i<buttonArray.count; i++) {
            UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(i%2*(width+5), i/2*30,width , 25);
            button.backgroundColor=[UIColor clearColor];
            button.layer.masksToBounds=YES;
            button.layer.cornerRadius=5;
            button.layer.borderColor=[UIColor lightGrayColor].CGColor;
            button.layer.borderWidth=1;
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            button.titleLabel.font=[UIFont systemFontOfSize:15];
            button.tag=i;
            [button setTitle:buttonArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
          
            [cell.contentView addSubview:button];
        }
        
        return cell;
    }
    
    return cell;
}
-(void)moreButtonClick:(UIButton*)button;
{
    NSLog(@"%ld",(long)button.tag);
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NagationButtonData* data=self.buttonDataArray[section];
    
    return data.title;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 30;
    }
    return 10;
}
@end
