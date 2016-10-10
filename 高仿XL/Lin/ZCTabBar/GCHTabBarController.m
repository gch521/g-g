//
//  GCHTabBarController.m
//  tabBar11
//
//  Created by gch on 16/7/26.
//  Copyright © 2016年 gch. All rights reserved.
//

#import "GCHTabBarController.h"

@implementation GCHTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设定tabbar的颜色
    [self.tabBar setTranslucent:YES];
    [self.tabBar setBarStyle:(UIBarStyleBlack)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tabBar bringSubviewToFront:self.centerButton];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    NSInteger centerIndex = viewControllers.count / 2;
    UIViewController *viewController = [[UIViewController alloc] init];
    NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:viewControllers];
    [newViewControllers insertObject:viewController atIndex:centerIndex];
    [super setViewControllers:newViewControllers];
    self.centerButton = [[GCHTabBarButton alloc] initWithTabBar:self.tabBar forItemIndex:centerIndex];
}

@end
