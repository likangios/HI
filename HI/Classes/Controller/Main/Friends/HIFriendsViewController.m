//
//  HIFriendsViewController.m
//  HI
//
//  Created by FengLing on 16/1/14.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIFriendsViewController.h"

@interface HIFriendsViewController ()

@end

@implementation HIFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"friend";
    self.tabBarItem.title = @"Friend";
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
