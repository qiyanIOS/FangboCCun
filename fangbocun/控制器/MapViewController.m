//
//  MapViewController.m
//  fangbocun
//
//  Created by apple on 15/11/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import "cellView.h"
@interface MapViewController ()<BMKMapViewDelegate,BMKPoiSearchDelegate>
@property(nonatomic,strong)NSString* cityText;
@property(nonatomic,strong)NSString*KeyText;
@property(nonatomic,strong)BMKMapView* mapView;
@property(nonatomic,strong)BMKPoiSearch* poisearch;

@property(nonatomic,assign)int curPage;
@property(nonatomic,strong)UIButton* nextPageButton;
@property(nonatomic,strong)UIView* bottomView;
@property(nonatomic,strong) BMKAnnotationView*annotationView;
@property(nonatomic,strong)UIButton* anBtn;
@property(nonatomic,strong)NSMutableArray* titleArray;
@property(nonatomic,strong)BMKPoiInfo* poi;
@property(nonatomic,assign)BOOL isOk;
@property(nonatomic,strong)cellView* mapCellView;
@end

@implementation MapViewController
-(NSMutableArray*)titleArray
{
    if (!_titleArray) {
        _titleArray=[NSMutableArray array];
    }
    return _titleArray;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
//    self.title=@"周边附近";
//    self.navigationItem.hidesBackButton=YES;
  
    [self getBMKMapView];
    [self getSerch];
  
    [self getView];
    _isOk=YES;
}
-(void)getBMKMapView
{

        self.mapView=[[BMKMapView alloc]initWithFrame:self.view.bounds];
        _poisearch = [[BMKPoiSearch alloc]init];
        
        self.cityText = @"西安";
        self.KeyText  = @"房地产";
        // 设置地图级别
        [_mapView setZoomLevel:5];
     //[_mapView setMinZoomLevel:1];
        _nextPageButton.enabled = false;
        _mapView.isSelectedAnnotationViewFront = YES;
    [_mapView setMaxZoomLevel:17];
     

  


        [self.view addSubview:self.mapView];

    
    


}
-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _poisearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _poisearch.delegate = nil; // 不用时，置nil
}

-(void)getSerch
{
    _curPage = 0;
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = _curPage;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= @"西安";
    citySearchOption.keyword = @"房地产";
    BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
    if(flag)
    {
        _nextPageButton.enabled = true;
        NSLog(@"城市内检索发送成功");
    }
    else
    {
        _nextPageButton.enabled = false;
        NSLog(@"城市内检索发送失败");
    }
    

}
-(void)getView
{
    self.bottomView=[[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    
    self.bottomView.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.7];
    self.bottomView.layer.borderColor=[UIColor blackColor].CGColor;
    self.bottomView.layer.borderWidth=1;
    self.bottomView.layer.masksToBounds=YES;

    
    _nextPageButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _nextPageButton.frame=CGRectMake(self.view.frame.size.width-100,7, 100, 30);
    [_nextPageButton setTitle:@"[下一页]" forState:UIControlStateNormal];

   [_nextPageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.nextPageButton];
    [_nextPageButton addTarget:self action:@selector(OnClick) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:self.bottomView];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 7, 200, 30)];
    label.text=@"每页10个,当前第1页";
    label.tag=100;
    label.textColor=[UIColor blackColor];
    
    [self.bottomView addSubview:label];
    
    UIButton* backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(20, 40, 50, 30);
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.5];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:backButton];
    
   

    
    
    
    
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)OnClick
{
    UILabel* label=(UILabel*)[self.view viewWithTag:100];
    
    
     label.text=[NSString stringWithFormat:@"每页10个,当前第%d页",_curPage+2];
    _curPage++;
    //城市内检索，请求发送成功返回YES，请求发送失败返回NO
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = _curPage;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= @"西安";
    citySearchOption.keyword = @"房地产";
    BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
    if(flag)
    {
        _nextPageButton.enabled = true;
        NSLog(@"城市内检索发送成功");
    }
    else
    {
        _nextPageButton.enabled = false;
        NSLog(@"城市内检索发送失败");
    }
    
    
}
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    // 生成重用标示identifier
    NSString *AnnotationViewID = @"xidanMark";
    
    // 检查是否有重用的缓存
    _annotationView = [view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    // 缓存没有命中，自己构造一个，一般首次添加annotation代码会运行到此处
    if (_annotationView == nil) {
        _annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        ((BMKPinAnnotationView*)_annotationView).pinColor = BMKPinAnnotationColorRed;
        // 设置重天上掉下的效果(annotation)
        ((BMKPinAnnotationView*)_annotationView).animatesDrop = YES;
    }
    
    // 设置位置
    _annotationView.centerOffset = CGPointMake(0, -(_annotationView.frame.size.height * 0.5));
    _annotationView.annotation = annotation;
    // 单击弹出泡泡，弹出泡泡前提annotation必须实现title属性
    _annotationView.canShowCallout = YES;
    _annotationView.image=[UIImage imageNamed:@"an.png"];
    
        
    _anBtn=[UIButton buttonWithType:UIButtonTypeCustom];
   
    _anBtn.backgroundColor=[UIColor brownColor];
        _anBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    
    [_anBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    [_annotationView addSubview:_anBtn];
    
    for (int i=0; i<self.titleArray.count; i++) {
         [_anBtn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        NSDictionary* attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
      
          CGFloat computeWidth=[self.titleArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil ].size.width;
        _anBtn.frame=CGRectMake(0, 0, computeWidth+10, 30);
    }
   
   

   
  
    // 设置是否可以拖拽
    _annotationView.draggable = NO;
    
    return _annotationView;
}
-(void)click:(UIButton*)button
{

    if (_isOk==YES) {

        NSString* str=[button titleForState:UIControlStateNormal];
        _mapCellView=[[cellView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-110, self.view.frame.size.width, 110) andName:str];
        [self.view addSubview:_mapCellView];
        _isOk=NO;
    }else
    {
        [_mapCellView removeFromSuperview];
        _isOk=YES;
    }
    
  
    
   
   
    
}
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    [mapView bringSubviewToFront:view];
    [mapView setNeedsDisplay];
   

}
//- (void)mapView:(BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views
//{
//    NSLog(@"大头针已经出现");
//}

#pragma mark -
#pragma mark implement BMKSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        NSMutableArray *annotations = [NSMutableArray array];
        for (int i = 0; i < result.poiInfoList.count; i++) {
           _poi = [result.poiInfoList objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            
            item.coordinate = _poi.pt;
            item.title = _poi.name;
                [self.titleArray addObject:_poi.name];
           
            [annotations addObject:item];
          
        }
    
        [_mapView addAnnotations:annotations];
        [_mapView showAnnotations:annotations animated:YES];
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
