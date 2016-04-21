//
//  regionData.h
//  fangbocun
//
//  Created by apple on 15/11/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface regionData : NSObject
@property(nonatomic,strong)NSArray* regionArray;
@property(nonatomic,strong)NSString*title;

+(NSArray*)dataWithRegionArray;

@end
