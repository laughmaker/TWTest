//
//  UIViewController+NavigationBar.m
//  XMThinMe
//
//  Created by 何振东 on 14/11/10.
//  Copyright (c) 2014年 寻觅. All rights reserved.
//

#import "UIViewController+NavigationBar.h"

@implementation UIViewController (NavigationBar)

- (void)hideNavigationBarBackground
{
    //去掉导航栏的原生背景
    for (UIView *view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
        {
            view.hidden = YES;
        }
    }
}

- (void)showNavigationBarBackground
{
    //去掉导航栏的原生背景
    for (UIView *view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
        {
            view.hidden = NO;
        }
    }
}

@end
