//
//  HIBaseViewController.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIBaseViewController.h"

@interface HIBaseViewController ()

@end

@implementation HIBaseViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (instancetype)initWithNib{
    return [self initWithNibName:NSStringFromClass(self.class) bundle:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]){
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //适配ios7
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    // Do any additional setup after loading the view from its nib.
}
#pragma mark item action
- (void)backAction:(id)sender{
    NSLog(@"right item click");
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)RightItemAction:(id)sender{
    
    NSLog(@"right item click");
}
- (void)dismissAction:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)closeAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - layout creat Item method
/**
 *  加一个返回item
 */
- (void)addBackItem{
    [self.navigationItem addLeftBarButtonItem:[self getBackItem]];
}
/**
 *  加一个右边 title item
 */
- (void)addRightWithTitle:(NSString *)title{
    [self.navigationItem addRightBarButtonItem:[self getTitleItem:title]];
}
/**
 *  加一个关闭item
 */
- (void)addCloseItem{
    [self.navigationItem addLeftBarButtonItem:[self getCloseItem]];
}
/**
 *  左边添加 一个返回 一个关闭item  例如： <- 关闭
 */
- (void)addLeftTwoItems{
    
    UIBarButtonItem *backItem = [self getBackItem];
    
    UIBarButtonItem *closeItem = [self getCloseItem];
    
    [self.navigationItem addLeftBarButtonItems:@[backItem,closeItem]];
    
}
/**
 *  获取一个 title item
 *
 *  @param title title
 *
 *  @return item
 */
- (UIBarButtonItem *)getTitleItem:(NSString *)title{
    
    UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [titleBtn setTitle:title forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [titleBtn addTarget:self action:@selector(RightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [titleBtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateHighlighted];
    UIBarButtonItem *TitleItem = [[UIBarButtonItem alloc] initWithCustomView:titleBtn];
    return TitleItem;
}
/**
 *  获取一个返回 item
 *
 *  @return item
 */
- (UIBarButtonItem *)getBackItem{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    backBtn.backgroundColor  =[UIColor orangeColor];
    [backBtn setImage:[UIImage imageNamed:@"toolbar_leftarrow"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
    return backItem;
}
/**
 *  获取一个关闭item
 *
 *  @return
 */
- (UIBarButtonItem *)getCloseItem{
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    closeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn setTitleColor:hi_color_a(0, 0, 0, 0.87) forState:UIControlStateNormal];
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeBtn];
    
    return closeItem;
}

/**
 *  返回一个 title item
 *
 *  @param title  title
 *  @param target target
 *  @param sel    sel
 *
 *  @return item
 */

- (UIBarButtonItem *)creatBarButtonItemWithTitle:(NSString *)title Target:(id)target selector:(SEL)sel{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:hi_color_a(0, 0, 0, 0.87) forState:UIControlStateNormal];
    CGSize size = [HIUntil CalSizeByString:title ForWidth:100 ForFont:button.titleLabel.font];
    button.frame =CGRectMake(0, 0, size.width, 44);
    
    UIBarButtonItem *Item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return Item;
}
#pragma mark other

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    BOOL hasResigned = [[self class] resignAnyFirstResponder:self.view];
    
}

+ (BOOL)resignAnyFirstResponder:(UIView *)view
{
    BOOL hasResigned = NO;
    for (UIView *subView in view.subviews) {
        if ([subView isFirstResponder]) {
            [subView resignFirstResponder];
            hasResigned = YES;
            if ([subView isKindOfClass:[UISearchBar class]]) {
                [(UISearchBar *)subView setShowsCancelButton:NO animated:YES];
            }
            break;
        }
        else {
            hasResigned = [[self class] resignAnyFirstResponder:subView] || hasResigned;
        }
    }
    return hasResigned;
}
#pragma mark UIAlert delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
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
