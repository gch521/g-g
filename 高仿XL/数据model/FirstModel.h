//
//  FirstModel.h
//  高仿XL
//
//  Created by gch on 16/9/27.
//  Copyright © 2016年 gch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstModel : NSObject

@property (nonatomic, strong)NSString *name; // 名字
@property (nonatomic, strong)NSString *nameImage; // 头像
@property (nonatomic, strong)NSString *time;  // 发布时间
@property (nonatomic, strong)NSArray *imageArray;  // 发布的图片数组
@property (nonatomic, strong)NSString *message; // 发布的内容

@property (nonatomic, assign)NSInteger type; // 区分第几个section

@property (nonatomic, strong)NSArray *vArray; // 视频数组

@end
