//
//  GetData.m
//  高仿XL
//
//  Created by gch on 16/9/27.
//  Copyright © 2016年 gch. All rights reserved.
//

#import "GetData.h"

#import "VModel.h"
#import "FirstModel.h"



@interface GetData ()
{
    NSArray *nameArray;
    NSArray *nameImageArray;
    NSArray *timeArray;
    NSArray *imageAllArray;
    NSArray *Array;
    
    NSMutableArray *httpArray;

}

@end

@implementation GetData

- (instancetype)init
{
    self = [super init];
    if (self) {
        nameArray = @[@"小狗", @"小小", @"唐古拉找死", @"爱新觉罗", @"小猫", @"呵呵"];
        nameImageArray = @[@"TabBarItemMore1@2x", @"TabBarItemMore1@2x",@"TabBarItemWish1@2x",@"icon_publish@2x",@"icon_publish_light@2x", @"TabBarItemReading1@2x"];
        timeArray = @[@"两分钟前",@"两天前",@"30天前",@"1小时前",@"3小时前", @"1个月前"];
        Array = @[@"我有一头小魔阿里", @"诶哦呜肉皮我去日哦脾气无肉 我我为UR破IQUR破IQ ", @" 欧IE无偶脾气如其欧赔我我为UR欧青浦人聘请入耳我我区瑞强我热去哦i", @"我已去哦撇UR群殴IP而欧派去肉片嵌入IE我UR群殴排入", @"我哦UI偶尔拍无人剖群殴譬如我企鹅而UI我入群欧派巫若萍气温UR欧派气温UR哦脾气乌尔欧派认为UI区瑞强", @"我破去我偶尔UR琼文UR欧派气温UR热我我就看论文封面独立思考加法"];
//        NSArray *imageArray6 =@[
//                                @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg"];
//        NSArray *imageArray1 = @[
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg"];
//        NSArray *imageArray2 = @[
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
//        NSArray *imageArray3 = @[
//                                 @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
//        NSArray *imageArray4 = @[
//                                 @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
//                                @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
//        NSArray *imageArray5 = @[
//                                 @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
//                                 @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
        NSArray *imageArray1 = @[@"dou1.jpg", @"dou2.jpg", @"dou3.jpg", @"dou4.jpg", @"dou5.jpg", @"dou6.jpg", @"dou7.jpg", @"dou8.jpg"];
         NSArray *imageArray2 = @[@"dou1.jpg", @"dou2.jpg"];
         NSArray *imageArray3 = @[@"dou1.jpg", @"dou2.jpg", @"dou3.jpg"];
         NSArray *imageArray4 = @[@"dou1.jpg", @"dou2.jpg", @"dou3.jpg", @"dou4.jpg"];
        
         NSArray *imageArray5 = @[@"dou1.jpg", @"dou2.jpg", @"dou3.jpg", @"dou4.jpg", @"dou5.jpg", @"dou6.jpg"];
         NSArray *imageArray6 = @[@"dou1.jpg", @"dou2.jpg", @"dou3.jpg", @"dou4.jpg", @"dou5.jpg", @"dou6.jpg", @"dou7.jpg", @"dou2.jpg", @"dou3.jpg"];
        NSArray *imageArray7 = @[];
        
       imageAllArray = @[imageArray5, imageArray4, imageArray3, imageArray2, imageArray1, imageArray6, imageArray7];
        
        
        // 视频构建所需的model
        NSArray *videoNameArray = @[@"穷小子最后变成了高富帅", @"重要肯努力, 一切都可能", @"我的天啊, 我说的太对了"];
        NSArray *map4Array = @[@"http://flv2.bn.netease.com/videolib3/1609/26/HgviV0417/SD/HgviV0417-mobile.mp4",
                               @"http://flv2.bn.netease.com/videolib3/1609/29/dBsSJ6000/SD/dBsSJ6000-mobile.mp4",
                               @"http://flv2.bn.netease.com/videolib3/1609/29/zcyQj5217/SD/zcyQj5217-mobile.mp4"];
        NSArray *map4LengthArray = @[@"213", @"65", @"355"];
        
        httpArray = [NSMutableArray array];
        
       
            
            NSMutableArray *tempArray = [NSMutableArray array];
            VModel *model1 = [[VModel alloc] init];
            int j = arc4random_uniform(3);
           // NSLog(@"---%d", j);
            model1.videoName = videoNameArray[j];
            model1.videoTime = map4LengthArray[j];
            model1.videoUrl = map4Array[j];
            [httpArray addObject:model1];
            
           // [httpArray addObject:tempArray];
            
        
        NSLog(@"---%@", httpArray);
        
        
        
       
        self.allDataArray = [NSMutableArray array];
        
        // 数据个数
        NSInteger allCount = 20;
        for (int i = 0; i < allCount; i++) {
            FirstModel *model = [[FirstModel alloc] init];
            model.name = nameArray[arc4random_uniform(6)];
            model.nameImage = nameImageArray[arc4random_uniform(6)];
            model.time = timeArray[arc4random_uniform(6)];
           
            model.message = Array[arc4random_uniform(6)];
            
            
            int jj = arc4random_uniform(3);
            if (jj  == 1) {
                int a = arc4random_uniform((int)httpArray.count);
                NSLog(@"我是随机的数=====%d",a);
                NSLog(@"我的数组是几个-----==%lu", (unsigned long)httpArray.count);
               
                model.vArray = httpArray;
            } else {
                model.imageArray = imageAllArray[arc4random_uniform(7)];
            
            }
            
            [self.allDataArray addObject:model];
            
            NSLog(@"---%lu------%lu", (unsigned long)model.imageArray.count, model.imageArray.count / 3);
        }

       
        
        
    }
    return self;
}


//- (NSArray *)getData
//{
//
//    
//    // 数据个数
//    NSInteger allCount = 20;
//    for (int i = 0; i < allCount; i++) {
//        FirstModel *model = [[FirstModel alloc] init];
//        model.name = nameArray[self.random];
//        model.nameImage = nameImageArray[self.random];
//        model.time = timeArray[self.random];
//        model.imageArray = imageAllArray[self.random];
//        [self.allDataArray addObject:model];
//    }
//   // return [self.allDataArray copy];
//}



@end
