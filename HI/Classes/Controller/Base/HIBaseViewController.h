//
//  HIBaseViewController.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  viewcontroller 的 基类
 */
@interface HIBaseViewController : UIViewController

/**
 *  dismiss 暂时没用
 *
 *  @param sender
 */
- (void)dismissAction:(id)sender;

/**
 *  导航栏添加一个返回item
 */
- (void)addBackItem;
/**
 *  返回按钮事件
 *
 *  @param sender
 */
- (void)backAction:(id)sender;
/**
 *  导航栏添加一个右边title item
 *
 *  @param title
 */
- (void)addRightWithTitle:(NSString *)title;
/**
 *  右边item点击
 *
 *  @param sender
 */
- (void)RightItemAction:(id)sender;

@end
