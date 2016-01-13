//
//  HICustomNavigationController.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HICustomNavigationController.h"

@interface HICustomNavigationController ()

@end

@implementation HICustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.clipsToBounds = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"ahhaha"] forBarMetrics:UIBarMetricsCompact];
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
