//
//  NewHouseViewController.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NewHouseViewController.h"
#import "NewTableViewCell.h"
#import "SmallHeardView.h"
#import "TWTSideMenuViewController.h"
#import "detailsViewController.h"
#import "RightButtonItem.h"
#import "UILabel+titleLabel.h"
#import "MoreView.h"
#import "MoreData.h"
@interface NewHouseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,assign)BOOL isOk;
@property(nonatomic,strong)NSMutableArray* mutableArray;
@property(nonatomic,strong)UIView* ccview;
@property(nonatomic,assign)BOOL open;
@property(nonatomic,strong)MoreView* moreView;
@end

@implementation NewHouseViewController
-(NSMutableArray*)mutableArray
{
    if (!_mutableArray) {
        _mutableArray=[NSMutableArray array];
    }
    return _mutableArray;
}
//-(UITableView*)tableView
//{
//    if (!_tableView) {
//        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.ccview.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-self.ccview.frame.size.height)];
//        _tableView.delegate=self;
//        _tableView.dataSource=self;
//       
//    }
//    return _tableView;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    [self getTableView];
    [self notification];
    [self getRightItem];
   
    [self  getNagationBar];
  
}
-(void)getNagationBar
{
    UILabel* titileLabel=[UILabel labelTextWithString:@"新房"];
    self.navigationItem.titleView=titileLabel;
    _open=YES;
   self.navigationController.navigationBar.translucent=NO;
    self.isOk=YES;
}
-(void)getRightItem
{
//    UIBarButtonItem* rightItem=[RightButtonItem rightItemImageName:@"icon_map" andSelectedImageName:@"icon_map_highlighted" andTarger:self andSelctor:@selector(loginClick)];
    UIBarButtonItem* moreRightItem=[RightButtonItem rightItemImageName:@"icon_filter_category_-1" andSelectedImageName:@"icon_filter_category_highlighted_-1" andTarger:self andSelctor:@selector(moreClick)];
    self.navigationItem.rightBarButtonItem=moreRightItem;
    
    
}
//-(void)loginClick
//{
//    
//}
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
     _ccview=[[UIView alloc]init];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.ccview.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-self.ccview.frame.size.height-self.tabBarController.tabBar.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    SmallHeardView* heardView=[[SmallHeardView alloc]initWithFrame:CGRectMake(0, self.ccview.frame.size.height, self.view.frame.size.width, 30)];
    self.tableView.tableHeaderView=heardView;
   

    
    
}

-(void)notification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(smallButtonChange:) name:@"SmallButtonChange" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(SliderButton:) name: @"sliderButton" object:nil];
}
-(void)SliderButton:(NSNotification*)nsnotification
{
    
         self.tabBarController.view.subviews[1].hidden=NO;
        [self.sideMenuViewController closeMenuAnimated:YES completion:nil];
    
   
    
    
    NSString* str=[nsnotification.userInfo[@"sliderButton"]titleForState:UIControlStateNormal];
    [self.mutableArray addObject:str];
    CGFloat startX=10;
    CGFloat startY=5;
    CGFloat  totalWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat buttonHeight=20;
    
    
    for (int i=0; i<self.mutableArray.count; i++) {

        UIButton* titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitle:self.mutableArray[i] forState:UIControlStateNormal];
        titleButton.layer.cornerRadius=4.0;
        [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];

        titleButton.titleLabel.font=[UIFont systemFontOfSize:14];
   
        titleButton.backgroundColor=[UIColor grayColor];
        
        NSDictionary* attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        
        CGFloat computeWidth=[self.mutableArray[i] boundingRectWithSize:CGSizeMake(totalWidth, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil ].size.width;
        
        if (startX+computeWidth+20 >= totalWidth) {
            startX=10;
            startY+=(buttonHeight+10);
            
        }
        titleButton.frame=CGRectMake(startX, startY, computeWidth+10, buttonHeight);
        
        startX=titleButton.frame.size.width+5+titleButton.frame.origin.x;
        
        
        [_ccview addSubview:titleButton];
       
        
    }
    _ccview.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, startY+buttonHeight+10);
    _ccview.backgroundColor=[UIColor grayColor];
    self.tableView.frame=CGRectMake(0, self.ccview.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
  
    [self.view addSubview:_ccview ];
     
    
    
    
    
}

-(void)smallButtonChange:(NSNotification*)notification
{
    
    NSInteger index=[notification.userInfo[@"SmallButtonChange"] integerValue];
    switch (index) {
        case 4:
           
       
            self.tabBarController.view.subviews[1].hidden=YES;
            
        
            [self.sideMenuViewController openMenuAnimated:YES completion:nil];
            
            break;
            
        default:
            break;
    }
    
    

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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
