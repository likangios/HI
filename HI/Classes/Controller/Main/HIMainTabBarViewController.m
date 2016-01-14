//
//  HIMainTabBarViewController.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIMainTabBarViewController.h"
#import "HICustomNavigationController.h"
@interface HIMainTabBarViewController ()

@end

@implementation HIMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViewControllers];
}
- (void)loadViewControllers{
    NSArray *vcs = @[@"HIHomePageViewController",@"HIFriendsViewController",@"HITopViewController",@"HIPersonalCenterViewController"];
    NSMutableArray *viewcontrollers = [NSMutableArray array];
    for (NSString *class_name in vcs) {
        UIViewController *vc = [[NSClassFromString(class_name) alloc]initWithNib];
        vc.view.backgroundColor = hi_color(arc4random()%255, arc4random()%255, arc4random()%255);
        HICustomNavigationController *nav = [[HICustomNavigationController alloc]initWithRootViewController:vc];
        [viewcontrollers addObject:nav];
    }
    self.viewControllers = viewcontrollers;
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
