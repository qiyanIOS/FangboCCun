//
//  MiddleView.m
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MiddleView.h"
#import "NewTableViewCell.h"
#import "RegionTableViewCell.h"
#import "detailsViewController.h"
#import "regionData.h"

@interface MiddleView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSIndexPath* selectedIndexPath;
@property(nonatomic,strong)UIButton* selectedBtn;
@property(nonatomic,strong)NSArray* regionArray;



//@property(nonatomic,strong)UIButton* selectedButton;
@end
@implementation MiddleView


-(NSArray*)regionArray
{
    if (!_regionArray) {
        _regionArray=[regionData dataWithRegionArray];
    }
    return _regionArray;
}

//-(id)init
-(id)initWithMiddleViewWithPoint:(CGPoint)point
{
    
    if (self=[super init]) {
        self.selectedIndexPath=nil;
        
        double width=([UIScreen mainScreen].bounds.size.width-40)/3;
        
        NSArray*strArray=@[@"新房",@"热门楼盘",@"打折优惠"];
        
        
        for (int i=0; i<strArray.count; i++) {
           self.button=[UIButton buttonWithType:UIButtonTypeSystem];
            [self.button setTitle:strArray[i] forState:UIControlStateNormal];
           self. button.backgroundColor=[UIColor grayColor];
            
            self.button.frame=CGRectMake(10+i*(width+10), 10, width, 40);
            [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.button.tintColor=[UIColor orangeColor];
            self.button.layer.cornerRadius=5.0;
            self.button.layer.masksToBounds=YES;
            [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            self.button.titleLabel.font=[UIFont boldSystemFontOfSize:17];
            
           if (0==i) {
                self.button.selected=YES;
                self.selectedBtn=self.button;
                
            }
           
            [self.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            self.button.tag=i;
            [self addSubview:self.button];
        }
        
        
      
        
        
        self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,self.button.frame.size.height+self.button.frame.origin.y+10 , [UIScreen mainScreen].bounds.size.width,420)];
        self.scrollView.showsHorizontalScrollIndicator=NO;
        self.scrollView.contentSize=CGSizeMake(3*[UIScreen mainScreen].bounds.size.width, 0);
        self.scrollView.pagingEnabled=YES;
        
        
        CGPoint Point=point;
        CGSize  Asize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.button.frame.origin.y+self.button.frame.size.height+10+self.scrollView.frame.size.height);
        
        self.frame=CGRectMake(Point.x, Point.y, Asize.width, Asize.height);
        
        
       
        self.oneTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.scrollView. frame.size.height)];
                self.oneTableView.dataSource=self;
        self.oneTableView.delegate=self;
        [self.oneTableView registerNib:[UINib nibWithNibName:@"NewTableViewCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
        self.oneTableView.scrollEnabled=NO;
        
//        self.twoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.scrollView. frame.size.height)];
        self.twoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.scrollView. frame.size.height) style:UITableViewStyleGrouped];
        
      

        self.twoTableView.dataSource=self;
        self.twoTableView.delegate=self;
//        self.twoTableView.scrollEnabled=NO;

//        [self.twoTableView registerClass:[RegionTableViewCell class] forCellReuseIdentifier:@"twoCell"];
        [self.twoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"twoCell"];
        
        self.thridTableView=[[UITableView alloc]initWithFrame:CGRectMake(2*self.frame.size.width, 0, self.frame.size.width, self.scrollView. frame.size.height)];
         [self.thridTableView registerNib:[UINib nibWithNibName:@"NewTableViewCell" bundle:nil] forCellReuseIdentifier:@"thridCell"];
        
        self.thridTableView.dataSource=self;
        self.thridTableView.delegate=self;
        self.thridTableView.scrollEnabled=NO;
        
        
        
                 [self addSubview:self.scrollView];
                [self.scrollView addSubview:self.oneTableView];
                [self.scrollView addSubview:self.twoTableView];
                [self.scrollView addSubview:self.thridTableView];
        
        
       
        
    
    }
    
    
    return self;
    
}
-(void)clickButton:(UIButton*)button
{
  
    switch (button.tag) {
        case 0:
           
            self.selectedBtn.selected=NO;
            button.selected=YES;
            self.selectedBtn=button;
            
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            
            
            break;
        case 1:
            self.selectedBtn.selected=NO;
            button.selected=YES;
            self.selectedBtn=button;
              [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
           
            break;
        case 2:
            
            self.selectedBtn.selected=NO;
            button.selected=YES;
            self.selectedBtn=button;
              [self.scrollView setContentOffset:CGPointMake(2*self.frame.size.width, 0) animated:YES];
            break;
            
        default:
            break;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==self.twoTableView) {
         return self.regionArray.count;
    }
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.twoTableView) {
        return 0;
    }
    return 3;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.oneTableView) {
        NewTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"oneCell"];

        return cell;
    }else if(tableView==self.twoTableView)
    {
        
       
//        RegionTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"twoCell"];
//     
//        
//        regionData* data=self.regionArray[indexPath.row];
//             cell.region=data;
//        
//        return cell;
 
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        
//        
//        regionData* data=self.regionArray[indexPath.row];
//        cell.region=data;
        cell.textLabel.text=[@(indexPath.row) stringValue];
        return cell;

        

        

    }else
    {
        NewTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"thridCell"];
        return cell;
    }
   
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.oneTableView) {
        return 110;
    }else if (tableView==self.twoTableView)
    {

//        UITableViewCell*cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
//        
//        
//        
//        
//        return cell.bounds.size.height;
        return 44;
      
        
    }else
    {
    return 110;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.twoTableView) {
        


    }else
    {
        detailsViewController* dvc=[detailsViewController new];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"jumpName" object:nil userInfo:@{@"jumpName":dvc}];
        
        
        
    }

}

//区域处理
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView==self.twoTableView) {
        
  
    regionData* data=self.regionArray[section];
    
    
    UIView* view=[[UIView alloc]init];
   
    UIButton* titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame=CGRectMake(10, 5, 100, 30);
    [titleButton setTitle:data.title forState:UIControlStateNormal];
    titleButton.backgroundColor=[UIColor grayColor];
    [view addSubview:titleButton];
    
    CGFloat startX=110;
    CGFloat startY=5;
        CGFloat  totalWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat buttonHeight=20;
    
    for (int i=0; i<data.regionArray.count; i++) {
        UIButton* titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitle:data.regionArray[i] forState:UIControlStateNormal];
        titleButton.layer.cornerRadius=4.0;
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor orangeColor]
                          forState:UIControlStateSelected];
        
        titleButton.backgroundColor=[UIColor clearColor];
        
        titleButton.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        titleButton.tag=i;
//        [titleButton addTarget:self action:@selector(regionButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        NSDictionary* attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        
        CGFloat computeWidth=[data.regionArray[i] boundingRectWithSize:CGSizeMake(totalWidth, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil ].size.width;
        
        if (startX+computeWidth+10 >= totalWidth) {
            startX=110;
            startY+=(buttonHeight+10);
            
        }
        titleButton.frame=CGRectMake(startX, startY, computeWidth+10, buttonHeight);
        
        startX=titleButton.frame.size.width+5+titleButton.frame.origin.x;
        [view addSubview:titleButton];
    }
    
     view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, startY+buttonHeight+10);

   
    return view;
    }
    return nil;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UIView* view=[self tableView:tableView viewForHeaderInSection:section];
    return view.frame.size.height;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView==self.twoTableView) {
   
    UIView* sectionView=[self tableView:tableView viewForHeaderInSection:section];
    
    
    
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, sectionView.frame.size.height, [UIScreen mainScreen].bounds.size.width, 1)];
    view.backgroundColor=[UIColor grayColor];
    view.alpha=0.8;
    return view;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    UIView* footView=[self tableView:tableView viewForFooterInSection:section];
    return footView.frame.size.height;
}

@end
