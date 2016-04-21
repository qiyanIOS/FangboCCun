//
//  HomeViewController.m
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "heardView.h"
#import "detailsViewController.h"
#import "TitleData.h"
#import "ZiXunViewController.h"
#import "MiddleView.h"
#import "WatchHomeTableViewController.h"

#import "HousingTableViewController.h"
#import "MapViewController.h"
#import "RightButtonItem.h"
#import "loginTableViewController.h"
#import "UILabel+titleLabel.h"
#import "calculatorViewController.h"
#import "MoreData.h"
#import "MoreView.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSArray* titleArray;
@property(nonatomic,strong)heardView*tableHeardView;
@property(nonatomic,strong)MiddleView* middleView;
@property(nonatomic,assign)NSInteger tableViewHeight;
@property(nonatomic,assign)NSInteger middleViewHeight;
@property(nonatomic,strong)UILabel* titileLabel;
@property(nonatomic,assign)BOOL open;
@property(nonatomic,assign)MoreView* moreView;

@end

@implementation HomeViewController
-(NSArray*)titleArray
{
    if (!_titleArray) {
        _titleArray=[TitleData titleDataArray];
    }
    return _titleArray;
}


-(UIScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
        
    }
    return _scrollView;
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]init];
    }
        _tableView.dataSource=self;
        _tableView.delegate=self;
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titileLabel=[UILabel labelTextWithString:@"首页"];
    self.navigationItem.titleView=self.titileLabel;
    _open=YES;
   
    self.navigationController.navigationBar.translucent=NO;
    
    
//    NSURLSession* session=[NSURLSession sharedSession];
//    NSURLRequest*request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://192.168.0.100/fangbocun/mobile/archive.php?aid=790"]];
//    NSURLSessionDataTask* task=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"%@",response);
//        
//    }];
//    [task resume];

    
  
//   
    [self getScrollView];
  
    [self getNotification];
    
    [self getRightItem];
    
  
   
    
}
-(void)getRightItem
{
    UIBarButtonItem* rightItem=[RightButtonItem rightItemImageName:@"icon_map" andSelectedImageName:@"icon_map_highlighted" andTarger:self andSelctor:@selector(loginClick)];
    
    UIBarButtonItem* moreRightItem=[RightButtonItem rightItemImageName:@"icon_filter_category_-1" andSelectedImageName:@"icon_filter_category_highlighted_-1" andTarger:self andSelctor:@selector(moreClick)];
    self.navigationItem.rightBarButtonItems=@[moreRightItem,rightItem];
    
    
    
}
-(void)loginClick
{
    UIStoryboard* sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    loginTableViewController* loginVc=[sb instantiateViewControllerWithIdentifier:@"myView"];
    
   
    [self.navigationController pushViewController:loginVc animated:YES];
}
-(void)moreClick
{
    

    
    _moreView=[MoreView sharedView];
    
   
    
    [self.view addSubview:_moreView];
    
    if (self.open==YES) {
       

    [MoreData methonWithView:_moreView andBool:self.open andView:nil];
        self.open=NO;
    self.tableView.userInteractionEnabled=NO;
    }else
    {
        [MoreData methonWithView:_moreView andBool:_open andView:nil];
       self.tableView.userInteractionEnabled=YES;
        self.open=YES;
    }
    
  
    
    
   
}

-(void) getScrollView
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tableView];

    [self getHeardTablVew];
    
    [self getMiddleView];
   

    self.scrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.tableViewHeight+self.middleViewHeight);
}
-(void)getHeardTablVew
{

    self.tableHeardView=[[heardView alloc]init];
    self.tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.tableHeardView.frame.size.height+6*44+90);
    self.tableViewHeight=self.tableHeardView.frame.size.height+6*44+80;
    
  
    self.tableView.scrollEnabled=NO;
    self.tableView.tableHeaderView=self.tableHeardView;
    
    UIView*FootView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    UIImageView* imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cncn"]];
    imageView.frame=FootView.frame;
    [FootView addSubview:imageView];
    self.tableView.tableFooterView=FootView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
 
}

-(void)getNotification
{
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonClick:) name:@"buttonClick" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jumpName:) name:@"jumpName" object:nil];
}
-(void)jumpName:(NSNotification*)notification
{
    UIViewController* vc=notification.userInfo[@"jumpName"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)buttonClick:(NSNotification*)notification
{
   
    NSLog(@"%ld",(long)[notification.userInfo[@"buttonClick"] integerValue]);

    
   
    NSInteger index=[notification.userInfo[@"buttonClick"] integerValue];

    switch (index) {
        case 0:

             self.tabBarController.selectedIndex=1;
           
            break;
        case 1:
              self.tabBarController.selectedIndex=7;
            break;
        case 2:
            self.tabBarController.selectedIndex=2;
            break;
        case 3:
            self.tabBarController.selectedIndex=3;
            break;
        case 4:
             self.tabBarController.selectedIndex=4;
            break;
        case 5:
             self.tabBarController.selectedIndex=6;
            
            break;
     
   

        default:
         
            break;
    }
    if (index==6) {
       MapViewController* vc=[MapViewController new];

      [self presentViewController:vc animated:YES completion:nil];
    }
    if (index==7) {
    
        
  
        calculatorViewController* vc=[calculatorViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}
//-(void)buttonLight:(NSNotification*)notification
//{
//    UIButton* selectedBtn=notification.userInfo[@"selectedBtn"];
//   NSInteger  index=[notification.userInfo[@"buttonLight"] integerValue];
//    NSLog(@"sss%ld",(long)index);
//    selectedBtn.selected=NO;
////    button.selected=YES;
////    selectedBtn=button;
//    
//}
-(void)getMiddleView
{

    self.middleView=[[MiddleView alloc]initWithMiddleViewWithPoint:CGPointMake(0, self.tableView.frame.size.height)];
    self.middleViewHeight=self.middleView.frame.size.height;
    [self.scrollView addSubview:self.middleView];

    

    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
          return 6;
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        TitleData* data=self.titleArray[indexPath.row];
        
        cell.textLabel.text=data.title;
    cell.textLabel.font=[UIFont boldSystemFontOfSize:17];
        return cell;
   
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
        NSString* titleForHeader=@"资讯头条";
        return titleForHeader;

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunViewController*vc=[ZiXunViewController new];
     vc.number=[@(indexPath.row) stringValue];
   
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//在你要隐藏的子页面中
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=YES;
    
}

@end
