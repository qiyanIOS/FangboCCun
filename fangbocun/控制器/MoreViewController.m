//
//  MoreViewController.m
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreView.h"
#import "MoreData.h"
#import "RightButtonItem.h"
@interface MoreViewController ()
@property(nonatomic,assign)BOOL open;
@property(nonatomic,strong)MoreView* moreView;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self getNagationBar];
    [self getRightItem];
}
-(void)getNagationBar
{
    _open=YES;
    self.navigationController.navigationBar.translucent=YES;
    self.title=@"更多";
    self.navigationItem.hidesBackButton=YES;
    self.view.backgroundColor=[UIColor brownColor];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
