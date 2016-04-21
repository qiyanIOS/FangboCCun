//
//  calculatorViewController.m
//  fangbocun
//
//  Created by apple on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.fangbocun.com/info.php?fid=123"]]];

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
