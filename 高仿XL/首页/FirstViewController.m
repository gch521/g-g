//
//  FirstViewController.m
//  高仿XL
//
//  Created by gch on 16/9/26.
//  Copyright © 2016年 gch. All rights reserved.
//

#import "FirstViewController.h"
#import "GetData.h"
#import "FirstTableViewCell.h"
#import "FirstModel.h"
#import "FooterView.h"

#import <objc/runtime.h>




@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

{
    UIView *ggView; // 表尾的view
    FirstTableViewCell *cell;
}

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;



@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor whiteColor];
    GetData *getData = [[GetData alloc] init];
    self.dataArray = [getData.allDataArray copy];

    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStyleGrouped)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,0.01)];
    _tableView.sectionHeaderHeight = 0;
    _tableView.sectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
   
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    NSLog(@"======%ld", section);
    ggView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    ggView.backgroundColor = [UIColor whiteColor];
    ggView.tag = section;
    
    NSArray *titleArray = @[@"转发", @"评论", @"点赞", @"私信"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton  new];
        button.frame = CGRectMake(0 + kScreenWidth / 4 * i, 0, kScreenWidth / 4 - 1, 30);
        [button setTitle:titleArray[i] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        
        button.alpha = 0.3;
        
        if (section == 0) {
            button.tag = i;
        } else {
            button.tag =  (i) * (section);
        }
        NSString *str = [NSString stringWithFormat:@"%ld", section];
        objc_setAssociatedObject(button, "firstObject", str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [button addTarget:self action:@selector(actionButton:) forControlEvents:(UIControlEventTouchUpInside)];
       
        [ggView addSubview:button];
        
        if (i < 4) {
            UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake((kScreenWidth / 4 -1) * i, 5, 1, 20)];
            bgView.backgroundColor = [UIColor grayColor];
            bgView.alpha = 0.3;
            [ggView addSubview:bgView];
        }
        
    }
    
    NSLog(@"---------");

    return ggView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [NSString stringWithFormat:@"Cell%ld", (long)indexPath.section];
    cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[FirstTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:str];
    }
    FirstModel *model = self.dataArray[indexPath.section];
    model.type = indexPath.section;
    cell.model = model;
    cell.imagesArr = self.dataArray;
   
    
#pragma  mark -- 取消点击的高亮状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat newFloat;
    FirstModel *model = self.dataArray[indexPath.section];
    if (model.imageArray.count == 0 && model.vArray.count != 0) {
        newFloat = [FirstTableViewCell cellWithModel:model] + 35 + 10 + 110 ;
        
    } else if (model.imageArray.count == 0 && model.vArray.count == 0) {
        newFloat = [FirstTableViewCell cellWithModel:model]  + 35 + 10 ;
    } else if (model.imageArray.count <= 3 && model.vArray.count == 0) {
        newFloat = [FirstTableViewCell cellWithModel:model] + 50 + 35 + 10 ;
    } else if (model.imageArray.count <= 6 && model.vArray.count == 0) {
        newFloat = [FirstTableViewCell cellWithModel:model] + 110  + 35 + 10 ;
    } else {
        newFloat = [FirstTableViewCell cellWithModel:model] + 170 + 35 + 10 ;
    }

    return newFloat;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.title = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
    
    

    
}

- (void)actionButton:(UIButton *)button
{
   NSString * first = objc_getAssociatedObject(button, "firstObject");
    NSInteger index = [first integerValue]; // 分区
    NSLog(@"========%ld", index);
     FirstModel *model = self.dataArray[index];
    if (index == 0) {
        if (button.tag == 0) {
            NSLog(@"我是%@的转发", model.name);
        } else if (button.tag == 1) {
            NSLog(@"我是%@的评论", model.name);
            
        } else if (button.tag == 2) {
            NSLog(@"我是%@的点赞", model.name);
            
        } else if (button.tag == 3) {
            NSLog(@"我是%@的私信", model.name);
            
        }

    } else {
        
        if (button.tag / index == 0) {
            NSLog(@"我是%@的转发", model.name);
        } else if (button.tag / index == 1) {
            NSLog(@"我是%@的评论", model.name);
            
        } else if (button.tag / index == 2) {
            NSLog(@"我是%@的点赞", model.name);
            
        } else if (button.tag / index == 3) {
            NSLog(@"我是%@的私信", model.name);
        }
    }
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
