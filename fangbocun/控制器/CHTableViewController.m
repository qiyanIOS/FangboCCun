//
//  CHTableViewController.m
//  fangbocun
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CHTableViewController.h"
#import "CHTableViewCell.h"
#import "regionData.h"

@interface CHTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray* regionArray;

@end

@implementation CHTableViewController

-(NSArray*)regionArray
{
    if (!_regionArray) {
        _regionArray=[regionData dataWithRegionArray];
    }
    return _regionArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTableView];

    
  
}
-(void)getTableView
{

   
    [self.tableView registerClass:[CHTableViewCell class] forCellReuseIdentifier:@"cell"] ;
    self.tableView.backgroundColor=[UIColor blackColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    UIView * heardView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.tableView.tableHeaderView=heardView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.regionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    regionData* data=self.regionArray[indexPath.section];

    cell.region=data;
    
    
  
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
      return cell.bounds.size.height;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    regionData* data=self.regionArray[section];
  
    

   return data.title;
}

@end
