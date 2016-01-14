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
    NSArray *navtitles = @[@"1",@"2",@"3",@"4"];
    NSArray *taritemtitle = @[@"11",@"22",@"33",@"44"];
    NSArray *tabimg = @[@"tabImg",@"tabImg",@"tabImg",@"tabImg"];
    NSArray *tabselimg = @[@"tabImg1",@"tabImg1",@"tabImg1",@"tabImg1"];
    NSMutableArray *viewcontrollers = [NSMutableArray array];
    NSInteger count = 0;
    for (NSString *class_name in vcs) {
        UIViewController *vc = [[NSClassFromString(class_name) alloc]initWithNib];
        vc.title = navtitles[count];
        vc.tabBarItem.title = taritemtitle[count];
        vc.tabBarItem.image = [[UIImage imageNamed:tabimg[count]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage =[[UIImage imageNamed:tabselimg[count]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
