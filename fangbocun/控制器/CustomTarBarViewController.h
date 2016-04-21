//
//  CustomTarBarViewController.h
//  fangbocun
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTarBarViewController : UIViewController<UINavigationControllerDelegate>
{
    NSArray* _nomallmageArray;
    NSArray*_hightlightedImageArray;
}
@property(nonatomic,assign)NSInteger selectedindex;
@property(nonatomic,strong)NSArray*viewControlls;
@property (weak, nonatomic) IBOutlet UIView *tabBarView;
- (IBAction)click:(id)sender;
-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed;






@end
