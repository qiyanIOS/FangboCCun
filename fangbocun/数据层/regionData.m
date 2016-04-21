//
//  regionData.m
//  fangbocun
//
//  Created by apple on 15/11/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "regionData.h"

@implementation regionData
+(NSArray*)dataWithRegionArray
{
    regionData* data=[[regionData alloc]init];
//    data.regionArray=@[@"城东",@"城南",@"城西",@"城北",@"高新",@"曲江",@"长安",@"浐灞",@"经开",@"西咸",@"宝鸡",@"咸阳",@"渭南",@"铜川",@"延安",@"榆林",@"汉中",@"安康",@"商洛"];
     data.regionArray=@[@"城东",@"城南",@"城西",@"城北",@"高新",@"曲江",@"长安",@"浐灞"];
    data.title=@"区域";
    regionData* data1=[[regionData alloc]init];
    data1.regionArray=@[@"400000-500",@"4000-900",@"2000-500",@"4000-900",@"78-33"];
     data1.title=@"价格";
    
    regionData* data2=[[regionData alloc]init];
    data2.regionArray=@[@"普通住宅",@"公寓",@"商住",@"别墅",@"商铺",@"写字楼",@"四合院",@"仓库"];
    data2.title=@"类型";
    regionData* data3=[[regionData alloc]init];
    data3.regionArray=@[@"打折优惠楼盘",@"小户型投资地产",@"教育地产",@"旅游地产",@"宜居生态地产",@"低密居所",@"公园地产",@"合作楼盘",@"综合体"];
    data3.title=@"特色";
    
    return @[data,data1,data2,data3];
}

@end
