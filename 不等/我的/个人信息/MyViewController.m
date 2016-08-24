//
//  MyViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "MyViewController.h"
#import "SheZhiViewController.h"
#import "GuanYuViewController.h"
#import "SheZhiViewController.h"
#import "GuanYuViewController.h"
#import "ShouCangViewController.h"
#import "MoneyViewController.h"
#import "YiJianViewController.h"
#import "MoneyViewController.h"
#import "YiJianViewController.h"
#import "PicViewController.h"
#import "imageDl.h"
#import "Oper.h"
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    
    
    UITableView * table;
    NSArray *array;
    NSArray *arr1;
    NSArray *arr2;
    NSArray *arr3;
    UIImageView * image;
    Oper* op;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    table = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate = self;
    arr1 = [NSArray arrayWithObjects:@"收藏",@"记账", nil];
    arr2 = [NSArray arrayWithObjects:@"设置",@"关于", nil];
    arr3 = [NSArray arrayWithObject:@"意见反馈"];
    array = @[arr1,arr2,arr3];
    
    UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    op=[[Oper alloc]init];
    NSString* str=[op selePic];
    image.image = [UIImage imageNamed:str];
    [vi addSubview:image];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [btn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:btn];
    table.tableHeaderView = vi;
    
    [self.view addSubview:table];

    // Do any additional setup after loading the view from its nib.
}
- (void)change{
    
    PicViewController* pic=[[PicViewController alloc]init];
    [self.navigationController pushViewController:pic animated:YES];
    
}
#pragma mark ---- UIScrollViewDelegate ----
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* aa=array[section];
    return aa.count;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return array.count;
}


- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    imageDl* dl=[imageDl imageDlInstance];
    if (dl.str!=nil) {
        image.image=[UIImage imageNamed:dl.str];
        [op updatePic:dl.str];
        dl.str=nil;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ide = @"ide";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ide];
    }
    NSArray* aa=array[indexPath.section];
    cell.textLabel.text = aa[indexPath.row];
    
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:
                cell.imageView.image =  [UIImage imageNamed:@"收藏"];
                break;
            case 1:
                cell.imageView.image =  [UIImage imageNamed:@"记账"];
                break;
                
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:
                cell.imageView.image =  [UIImage imageNamed:@"设置"];
                break;
            case 1:
                cell.imageView.image =  [UIImage imageNamed:@"关于"];
                break;
                
            default:
                break;
        }
    }

    if (indexPath.section == 2) {
        
        cell.imageView.image =  [UIImage imageNamed:@"意见反馈"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        ShouCangViewController *shoucang = [[ShouCangViewController alloc]init];
        [self.navigationController pushViewController:shoucang animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        MoneyViewController *money = [[MoneyViewController alloc]init];
        [self.navigationController pushViewController:money animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        SheZhiViewController *shezhi = [[SheZhiViewController alloc]init];
        [self.navigationController pushViewController:shezhi animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        GuanYuViewController *guanyu = [[GuanYuViewController alloc]init];
        [self.navigationController pushViewController:guanyu animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        YiJianViewController *yijian = [[YiJianViewController alloc]init];
        [self.navigationController pushViewController:yijian animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    
    
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
