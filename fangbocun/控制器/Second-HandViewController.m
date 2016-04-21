//
//  Second-HandViewController.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Second-HandViewController.h"
#import "Second-HandTableViewCell.h"
#import "detailsViewController.h"
#import "RightButtonItem.h"
#import "UILabel+titleLabel.h"
#import "MoreData.h"
#import "MoreView.h"
@interface Second_HandViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)MoreView* moreView;
@property(nonatomic,assign)BOOL open;
@end

@implementation Second_HandViewController
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-self.tabBarController.tabBar.frame.size.height-10)];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
 

    [self getTableView];
    [self getRightItem];
    [self getNagationBar];
}
-(void)getNagationBar
{
    _open=YES;
    self.navigationController.navigationBar.translucent=NO;
    UILabel* titileLabel=[UILabel labelTextWithString:@"二手房"];
    self.navigationItem.titleView=titileLabel;
}
-(void)getRightItem
{
   
    UIBarButtonItem* moreRightItem=[RightButtonItem rightItemImageName:@"icon_filter_category_-1" andSelectedImageName:@"icon_filter_category_highlighted_-1" andTarger:self andSelctor:@selector(moreClick)];
    self.navigationItem.rightBarButtonItem=moreRightItem;
    
    
}

-(void)moreClick
{
    _moreView=[MoreView sharedView];
    
    [self.view addSubview:_moreView];
    
    if (self.open==YES) {
        
        [MoreData methonWithView:_moreView andBool:self.open andView:nil];
        self.open=NO;
        self.view.userInteractionEnabled=NO;
    }else
    {
        [MoreData methonWithView:_moreView andBool:_open andView:nil];
        self.view.userInteractionEnabled=YES;
        self.open=YES;
    }
    

    
}
-(void)getTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"Second-HandTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailsViewController* dvc=[detailsViewController new];
    [self.navigationController pushViewController:dvc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=NO;
    
}
@end
