//
//  HIBaseTabBarSubViewController.m
//  HI
//
//  Created by FengLing on 16/1/14.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIBaseTabBarSubViewController.h"

@interface HIBaseTabBarSubViewController ()

@end

@implementation HIBaseTabBarSubViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  self =   [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
    
    [self.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    
    self.tabBarItem.titlePositionAdjustment = UIOffsetMake(3, 0);
    self.tabBarItem.imageInsets  = UIEdgeInsetsMake(0,0, 0, 0);
    // Do any additional setup after loading the view from its nib.
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
