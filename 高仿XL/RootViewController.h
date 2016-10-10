//
//  RootViewController.h
//  高仿XL
//
//  Created by gch on 16/9/26.
//  Copyright © 2016年 gch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController //

// 主视图控制器
@property (nonatomic, strong)UIViewController *mainViewController;

// 获取单利
+ (instancetype)shareManager;


@end
