//
//  NagationButtonData.h
//  fangbocun
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NagationButtonData : NSObject
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSArray* buttonDataArray;
+(NSArray*)buttonDataArray;
@end
