//
//  AppDelegate.m
//  fangbocun
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "NewHouseViewController.h"
#import "Second-HandViewController.h"
#import "RentViewController.h"
#import "InformationViewController.h"
#import "loginTableViewController.h"

#import "MyTabBarViewController.h"
#import "CHTableViewController.h"
#import "TWTSideMenuViewController.h"
#import "HousingTableViewController.h"
#import "WatchHomeTableViewController.h"


#import <BaiduMapAPI_Map/BMKMapComponent.h>
@interface AppDelegate ()

@end
BMKMapManager* _mapManager;
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor=[UIColor whiteColor];
    _mapManager=[[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"ofz3GzYGB1jML2iVGaLR87F7" generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    [_window makeKeyAndVisible];


    NewHouseViewController* NVc=[[NewHouseViewController alloc]init];
    UINavigationController* houseNavi=[[UINavigationController alloc]initWithRootViewController:NVc];
   
    
   CHTableViewController* deVc=[[CHTableViewController alloc]init];
    TWTSideMenuViewController* sideMenuViewController=[[TWTSideMenuViewController alloc]initWithMenuViewController:deVc mainViewController:houseNavi];
    sideMenuViewController.shadowColor=[UIColor blackColor];
    sideMenuViewController.edgeOffset = UIOffsetMake(18.0f, 0.0f);
        sideMenuViewController.zoomScale = 0.5634f;
    
    UINavigationController* homeNavi=[[UINavigationController alloc]initWithRootViewController:[HomeViewController new]];
    UINavigationController* SecondNavi=[[UINavigationController alloc]initWithRootViewController:[Second_HandViewController new]];
    UINavigationController* rentNavi=[[UINavigationController alloc]initWithRootViewController:[RentViewController new]];
    
    UINavigationController*inforNavi=[[UINavigationController alloc]initWithRootViewController:[InformationViewController new]];
  
    UIStoryboard* sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    loginTableViewController* vc=[sb instantiateViewControllerWithIdentifier:@"myView"];
      UINavigationController*moreNavi=[[UINavigationController alloc]initWithRootViewController:vc];
    HousingTableViewController* housVc=[HousingTableViewController new];
    UINavigationController * dnavi=[[UINavigationController alloc]initWithRootViewController:housVc];
    
    UINavigationController* Wnavi=[[UINavigationController alloc]initWithRootViewController:[WatchHomeTableViewController new]];
 
    MyTabBarViewController* tabbar=[[MyTabBarViewController alloc]init];
    
   

   // tabbar.viewControllers=@[homeNavi, sideMenuViewController,SecondNavi,rentNavi,inforNavi,moreNavi,dnavi,Wnavi];
   tabbar.viewControllers=@[homeNavi, sideMenuViewController,SecondNavi,rentNavi,inforNavi,moreNavi,dnavi,Wnavi];
    
    
    
    _window.rootViewController=tabbar;
    
      [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}


@end
