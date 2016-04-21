//
//  MoreData.m
//  dd
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MoreData.h"

@implementation MoreData

+(void)methonWithView:(UIView *)cView andBool:(BOOL)open andView:(UIView *)controllerView
{
   
    
  
    
    if (open==YES) {
        
        
        
        [UIView animateWithDuration:0.35 animations:^{
            
            
            cView.frame=CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-20, 200);
            

            
        }];
        
        
         open=NO;
    }
   
    else 
    {
        [UIView animateWithDuration:0.35 animations:^{
           
            
            cView.frame=CGRectMake(10, -200, [UIScreen mainScreen].bounds.size.width-20, 200);
          
            NSLog(@"shang");
        }];
        
        
       open=YES;
        
       
        
    }

  

}

@end
