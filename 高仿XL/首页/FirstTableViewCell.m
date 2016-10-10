//
//  FirstTableViewCell.m
//  高仿XL
//
//  Created by gch on 16/9/27.
//  Copyright © 2016年 gch. All rights reserved.
//

#import "FirstTableViewCell.h"

#import "VModel.h"


#import "MJPhotoBrowser.h"
#import "MJPhoto.h"


#import <objc/runtime.h>

@interface FirstTableViewCell ()



@end

@implementation FirstTableViewCell

{
    NSArray *imagesArray; //  接受imagesArr
    NSInteger section;  // 标记第几分区的

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 清除图片缓存，便于测试
       // [[SDWebImageManager sharedManager].imageCache clearDisk];
        
        [self addViews];
    }
    return self;
}
- (void)addViews
{
    self.nameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    //self.nameImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.nameImageView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, kScreenWidth - 45, 20)];
    //self.nameLabel.backgroundColor = [UIColor greenColor];
    [self addSubview:self.nameLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 25, kScreenWidth - 45, 10)];
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    self.timeLabel.textColor = [UIColor redColor];
    [self addSubview:self.timeLabel];
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, kScreenWidth - 10, 20)];
    [self addSubview:self.messageLabel];
    self.messageLabel.font = [UIFont systemFontOfSize:14];
    self.messageLabel.numberOfLines = 0;
    
    self.bgView = [UIView new];
    [self addSubview:self.bgView];
     //self.bgView.backgroundColor = [UIColor redColor];
    
    
    
    
}


- (void)setModel:(FirstModel *)model
{
    
    if (_model != model) {
        _model = [[FirstModel alloc] init];
    }
    self.nameImageView.image = [UIImage imageNamed:model.nameImage];
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.time;
    self.messageLabel.text = model.message;
    section = model.type; // 第几分区
    
    NSLog(@"-----我的天啊-----%ld", (long)model.type);
    
    NSArray *array = @[[UIColor redColor], [UIColor greenColor], [UIColor redColor], [UIColor purpleColor], [UIColor orangeColor], [UIColor blueColor]];
    
    if (model.message.length == 0) {
        
    } else {
        CGRect newFrame = self.messageLabel.frame;
        newFrame.size.height = [FirstTableViewCell cellWithModel:model];
        self.messageLabel.frame = newFrame;
    }
    
    if (model.imageArray.count == 0 && model.vArray.count != 0) {
        
#pragma mark -- 视频
        
        CGRect newFrame = self.bgView.frame;
        CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
        newFrame = CGRectMake(5, bgFloat + 35, 170, 110);
        self.bgView.frame = newFrame;
        self.bgView.backgroundColor = [UIColor purpleColor];
        NSLog(@"====vArray的数组===%lu", (unsigned long)model.vArray.count);
        VModel *vmodel = model.vArray[0];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        [self.bgView addSubview:label];
        label.text = vmodel.videoName;
        NSLog(@"===视频==%@", vmodel.videoName);
        
    } else if (model.imageArray.count == 0  && model.vArray.count == 0) {
    
    } else {
        float number = model.imageArray.count / 3;// 有几行
        float count = model.imageArray.count % 3; // 不满一行, 剩余几个
        if (number == 0) {
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 50);
            self.bgView.frame = newFrame;
            
            
            int a = 0;
            
            for (int i = 0; i < count; i++) {
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 0, 50, 50)];
                imageV.image = [UIImage imageNamed:model.imageArray[a]];
                imageV.backgroundColor = array[arc4random_uniform(6)];
                [self.bgView addSubview:imageV];
                
                
                
#pragma --------
                imageV.tag = a++;
                imageV.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [imageV addGestureRecognizer:singleTap];
                
                NSString *str = [NSString stringWithFormat:@"%ld", section];
                objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            
            
        } else if (number == 1 && count != 0) {
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 110);
            self.bgView.frame = newFrame;
            
            int a = 0;
            
            for (int i = 0; i < 3; i++) {
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 0 , 50, 50)];
                imageV.image = [UIImage imageNamed:model.imageArray[a]];
                imageV.backgroundColor = array[arc4random_uniform(6)];
                [self.bgView addSubview:imageV];
                
#pragma --------
                imageV.tag = a++;
                imageV.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [imageV addGestureRecognizer:singleTap];
                
                NSString *str = [NSString stringWithFormat:@"%ld", section];
                objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            
            for (int i = 0; i < count; i++) {
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 60 , 50, 50)];
                imageV.image = [UIImage imageNamed:model.imageArray[a]];
                imageV.backgroundColor = array[arc4random_uniform(6)];
                [self.bgView addSubview:imageV];
#pragma --------
                imageV.tag = a++;
                imageV.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [imageV addGestureRecognizer:singleTap];
                
                NSString *str = [NSString stringWithFormat:@"%ld", section];
                objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            
        } else if (number == 1 && count == 0) {
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 50);
            self.bgView.frame = newFrame;
            
            
            
            int a = 0;
            for (int i = 0; i < 3; i++) {
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 0 , 50, 50)];
                imageV.image = [UIImage imageNamed:model.imageArray[a]];
                imageV.backgroundColor = array[arc4random_uniform(6)];
                [self.bgView addSubview:imageV];
#pragma --------
                imageV.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [imageV addGestureRecognizer:singleTap];
                
                NSString *str = [NSString stringWithFormat:@"%ld", section];
                objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                imageV.tag = a++;
            }
            
            
        } else if (number == 2 && count != 0) {
            
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 170);
            self.bgView.frame = newFrame;
            
            
            int a = 0;
            for (int j = 0; j < 2; j++) {
                for (int i = 0; i < 3; i++) {
                    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 60 * j , 50, 50)];
                    imageV.image = [UIImage imageNamed:model.imageArray[a]];                    imageV.backgroundColor = array[arc4random_uniform(6)];
                    [self.bgView addSubview:imageV];
#pragma --------
                    imageV.userInteractionEnabled = YES;
                    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                    [imageV addGestureRecognizer:singleTap];
                    
                    NSString *str = [NSString stringWithFormat:@"%ld", section];
                    objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    imageV.tag = a++;
                    NSLog(@"6张以上图片----%ld", (long)imageV.tag);
                }
                
            }
            
            
           
            for (int i = 0; i < count; i++) {
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 60 * 2 , 50, 50)];
                imageV.image = [UIImage imageNamed:model.imageArray[a]];
                imageV.backgroundColor = array[arc4random_uniform(6)];
                [self.bgView addSubview:imageV];
                
#pragma --------
                imageV.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [imageV addGestureRecognizer:singleTap];
                NSString *str = [NSString stringWithFormat:@"%ld", section];
                objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                imageV.tag = a++;
                NSLog(@"6张以上图片----%ld", (long)imageV.tag);
            }
            
            
        } else if (number == 2 && count == 0) {
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 110);
            self.bgView.frame = newFrame;
            
            
            
            int a = 0;
            for (int j = 0; j < 2; j++) {
                for (int i = 0; i < 3; i++) {
                    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 60 * j , 50, 50)];
                    imageV.image = [UIImage imageNamed:model.imageArray[a]];
                    imageV.backgroundColor = array[arc4random_uniform(6)];
                    [self.bgView addSubview:imageV];
#pragma --------
                    imageV.tag = a++;
                    imageV.userInteractionEnabled = YES;
                    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                    [imageV addGestureRecognizer:singleTap];
                    NSString *str = [NSString stringWithFormat:@"%ld", section];
                    objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                
            }
            
            
        } else {
            CGRect newFrame = self.bgView.frame;
            CGFloat bgFloat = [FirstTableViewCell cellWithModel:model];
            newFrame = CGRectMake(5, bgFloat + 35, 170, 170);
            self.bgView.frame = newFrame;
            
            
            int a = 0;
            for (int j = 0; j < 3; j++) {
                for (int i = 0; i < 3; i++) {
                    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(60 * i, 60 * j , 50, 50)];
                    imageV.image = [UIImage imageNamed:model.imageArray[a]];
                    imageV.backgroundColor = array[arc4random_uniform(6)];
                    [self.bgView addSubview:imageV];
                    
                    
                    
#pragma --------  imageV.tag 标记是区分哪个imageView
                    /** 关联:点击的是哪个分区
                     *  NSString *str = [NSString stringWithFormat:@"%ld", section];
                     objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                     */
                    imageV.tag = a++;
                    imageV.userInteractionEnabled = YES;
                    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                    [imageV addGestureRecognizer:singleTap];
                    
                    NSString *str = [NSString stringWithFormat:@"%ld", section];
                    objc_setAssociatedObject(singleTap, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                
            }
            
            
            
        }
        
    }
    
    
    
    
    
    

}

- (void)setImagesArr:(NSArray *)imagesArr
{
    if (imagesArr != _imagesArr) {
        _imagesArr  = [NSArray array];
    }
    
    imagesArray = imagesArr;
}

-(void)tapImageAction:(UITapGestureRecognizer *)tap{
    UIImageView *tapView = (UIImageView *)tap.view;
    
    NSString * first = objc_getAssociatedObject(tap, "firstObject");
    NSInteger index = [first integerValue]; // 分区
    FirstModel *model = imagesArray[index];
    NSArray *imageA = model.imageArray;
    
    NSLog(@"---%ld", imageA.count);
    
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:imageA.count];
    
    for (int i = 0; i < imageA.count; i++) {
        MJPhoto *photo = [[MJPhoto alloc] init];
        // 选择本地图片
        photo.image = [UIImage imageNamed:imageA[i]];
        // 使用url
        // 替换为中等尺寸图片, _urls存放url的数组
//        NSString *url = [_urls[i] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
//         photo.url = [NSURL URLWithString:url]; // 图片路径
        

        photo.srcImageView = self.bgView.subviews[i]; // 图片路径
//        photo.placeholder = [UIImage imageNamed:@""]; // 占位图
        [photos addObject:photo];
    }
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = (int)tapView.tag; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    [browser show];

    
}




// 给我一个字符串, 我还你一个高度
+ (CGFloat ) cellWithModel:(FirstModel *)model
{
    
    // 计算字符串的高度
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    CGRect labelFrame = [model.message boundingRectWithSize:CGSizeMake(kScreenWidth - 10, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return labelFrame.size.height;
    
    
}


@end
