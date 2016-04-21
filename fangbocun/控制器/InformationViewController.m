//
//  InformationViewController.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "InformationViewController.h"
#import "TitleData.h"
#import "ZiXunViewController.h"
#import "UILabel+titleLabel.h"
#import "MoreData.h"
#import "MoreView.h"
#import "RightButtonItem.h"
@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* dataArray;
@property(nonatomic,strong)MoreView* moreView;
@property(nonatomic,assign)BOOL open;
@end

@implementation InformationViewController

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}
-(NSArray*)dataArray
{
    if (!_dataArray) {
        _dataArray=[TitleData titleDataArray];
    }
    return _dataArray;
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
    UILabel* titileLabel=[UILabel labelTextWithString:@"资讯"];
    self.navigationItem.titleView=titileLabel;
    
    self.navigationItem.hidesBackButton=YES;
}
-(void)getTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    TitleData* data=self.dataArray[indexPath.row];
    cell.textLabel.text=data.title;
    cell.textLabel.font=[UIFont boldSystemFontOfSize:17];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunViewController* Zvc=[ZiXunViewController new];
    [self.navigationController pushViewController:Zvc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=NO;
    
}

@end
