//
//  RootViewController.m
//  高仿XL
//
//  Created by gch on 16/9/26.
//  Copyright © 2016年 gch. All rights reserved.
//

#import "RootViewController.h"

// tabbar将要显示的内容控制器
#import "FirstViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"
#import "MessageViewController.h"
#import "AddViewController.h"

#import "GCHTabBarController.h" // tabbar
#import "GCHTabBarButton.h"


@interface RootViewController ()

@property (nonatomic, strong)FirstViewController *firstViewController;
@property (nonatomic, strong)FindViewController *findViewControler;
@property (nonatomic, strong)MeViewController *MeViewController;
@property (nonatomic, strong)MessageViewController *messageViewController;

@property (nonatomic, strong)GCHTabBarController *tabBarController;

@end

@implementation RootViewController

+ (instancetype)shareManager
{
    static RootViewController *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[RootViewController alloc] init];
    });
    return _shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mainViewController = [self creatMainController];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIViewController *)creatMainController
{
    //创建tabbar内容视图
    self.firstViewController = [[FirstViewController alloc] init];
    self.findViewControler = [[FindViewController alloc] init];
    self.MeViewController = [[MeViewController alloc] init];
    self.messageViewController = [[MessageViewController alloc] init];
    
    //将内容视图装载到NavigationController里
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:self.firstViewController];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:self.messageViewController];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:self.findViewControler];
    UINavigationController *navController4 = [[UINavigationController alloc] initWithRootViewController:self.MeViewController];
    
    //创建并设置tabBarController
    self.tabBarController = [[GCHTabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2, navController3, navController4, nil];
    [self addChildVC:self.firstViewController  title:@"首页" image:@"TabBarItemRead@2x"
         selectImage:@"TabBarItemRead1@2x"];
    [self addChildVC:self.messageViewController  title:@"消息" image:@"TabBarItemReading@2x" selectImage:@"TabBarItemReading1@2x"];
    [self addChildVC:self.findViewControler  title:@"发现" image:@"TabBarItemWish@2x" selectImage:@"TabBarItemWish1@2x"];
    [self addChildVC:self.MeViewController  title:@"我的" image:@"TabBarItemMore@2x" selectImage:@"TabBarItemMore1@2x"];
    
    self.tabBarController.selectedIndex = 0;
    
    //设置tabBar中间的按钮
    [self.tabBarController.centerButton setHeightOffset:5];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish"]
                                        forState:UIControlStateNormal];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish_light"]
                                        forState:UIControlStateHighlighted];
    [self.tabBarController.centerButton addTarget:self
                                           action:@selector(centerButtonPressed)
                                 forControlEvents:UIControlEventTouchUpInside];
    
    return self.tabBarController;
}

- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    childVC.title = title;
    
    childVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectImage]];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}
                           forState:UIControlStateSelected];

}


#pragma mark - tabbar中间的按钮动作

//按钮按下
- (void)centerButtonPressed
{
    //弹出child2
    AddViewController *child2 = [[AddViewController alloc] init];
    [self.tabBarController presentViewController:child2 animated:YES completion:nil];
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
