//
//  NagationButtonData.m
//  fangbocun
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "NagationButtonData.h"

@implementation NagationButtonData
+(NSArray*)buttonDataArray
{
    NagationButtonData* data=[[NagationButtonData alloc]init];
    data.buttonDataArray=@[@"首页",@"新房",@"房价",@"二手",@"出租",@"经纪人",@"经纪公司",@"小区",@"写字楼",@"商铺",@"看房团",@"团购",@"资讯",@"视频",@"图库"];
    data.title=@"导航栏";
    NagationButtonData* data1=[[NagationButtonData alloc]init];
    
    data1.buttonDataArray=@[@"购房工具",@"新房地图",@"二手找房",@"租房找房"];
    data1.title=@"工具栏";
    
    return @[data,data1];
    
    
    
    
    
    
}
@end
