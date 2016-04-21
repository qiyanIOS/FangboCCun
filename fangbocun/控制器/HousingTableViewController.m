//
//  HousingTableViewController.m
//  fangbocun
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HousingTableViewController.h"

@interface HousingTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HousingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"HousingTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.navigationItem.hidesBackButton=YES;
    self.title=@"小区";
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden=YES;
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden=NO;
//}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray* array=self.tabBarController.view.subviews;
    
    UIView* view=array[1];
    view.hidden=NO;
    
}
@end
