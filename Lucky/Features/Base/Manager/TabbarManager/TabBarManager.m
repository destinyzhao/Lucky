//
//  TabBarManager.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "TabBarManager.h"
#import "AppDelegate.h"
#import "MainViewController.h"

@implementation TabBarManager

+ (void)setupMainTabBarController
{
    MainViewController *minTabBar = [[MainViewController alloc]init];
    ((AppDelegate*)([UIApplication sharedApplication].delegate)).window.rootViewController = minTabBar;
}

@end
