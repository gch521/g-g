//
//  FirstTableViewCell.h
//  高仿XL
//
//  Created by gch on 16/9/27.
//  Copyright © 2016年 gch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"






@interface FirstTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *nameImageView;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UILabel *messageLabel;
@property (nonatomic, strong)FirstModel *model;

@property (nonatomic, strong)UIView *ggView;




@property (nonatomic, strong)NSArray *imagesArr; // 接受所有数据, 于FirstViewController等同于dataArray





// 声明计算方法, 方便外部访问
+ (CGFloat ) cellWithModel:(FirstModel *)model;



@end
