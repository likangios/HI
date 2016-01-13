//
//  HIMainTabBarViewController.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIMainTabBarViewController.h"

@interface HIMainTabBarViewController ()

@end

@implementation HIMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViewControllers];
    // Do any additional setup after loading the view from its nib.
}
- (void)loadViewControllers{
    NSArray *vcs = @[@"HIViewController1",@"HIViewController2",@"HIViewController3",@"HIViewController4"];
    NSMutableArray *viewcontrollers = [NSMutableArray array];
    for (NSString *class_name in vcs) {
        UIViewController *vc = [[NSClassFromString(class_name) alloc]initWithNib];
        vc.view.backgroundColor = hi_color(arc4random()%255, arc4random()%255, arc4random()%255);
        vc.tabBarItem.title = NSStringFromClass(vc.class);
        [viewcontrollers addObject:vc];
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
