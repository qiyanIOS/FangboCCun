//
//  cellView.m
//  fangbocun
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "cellView.h"
#import "mapCellTableViewCell.h"
@interface cellView()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation cellView

-(id)initWithFrame:(CGRect)frame andName:(NSString *)name
{
    if (self=[super initWithFrame:frame]) {
        UITableView* tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        tableView.delegate=self;
        tableView.dataSource=self;
       
        
        self.backgroundColor=[UIColor grayColor];// colorWithAlphaComponent:0.5];
        [tableView registerNib:[UINib nibWithNibName:@"mapCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        
        self.titleName=name;
        
        [self addSubview:tableView];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    mapCellTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"]; 
   
    cell.titleLabel.text=_titleName;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size.height;
}





@end
