//
//  HITopViewController.m
//  HI
//
//  Created by FengLing on 16/1/14.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HITopViewController.h"

@interface HITopViewController ()

@end

@implementation HITopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"top";
    self.tabBarItem.title = @"Top";
    self.tabBarItem.image = [[UIImage imageNamed:@"tabImg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage =[[UIImage imageNamed:@"tabImg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
