//
//  pictureViewController.m
//  不等
//
//  Created by 中软国际新014 on 16/5/25.
//  Copyright © 2016年 中软国际011. All rights reserved.
//
#import "SecondController.h"
#import "pictureViewController.h"
#import "FirstDanLi.h"
#import "Anniudanli.h"
#import "FirstOper.h"
#import "First.h"
#define xfit [UIScreen mainScreen].bounds.size.width/375
#define yfit [UIScreen mainScreen].bounds.size.height/667
@interface pictureViewController ()

@end

@implementation pictureViewController
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    FirstDanLi * fdanli = [FirstDanLi firstdanli];
    Anniudanli * adanli = [Anniudanli anniudanli];
    FirstOper * oper = [[FirstOper alloc]init];
    NSArray * arr = [[NSArray alloc]init];
    arr = [oper selectpicfrompicture:fdanli.first];
    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 70*xfit, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-70*yfit)];
    view.image = [UIImage imageNamed:arr[adanli.tag]];
    
    NSString * path  = arr[adanli.tag];
    
    
    NSString* fullpath=[[NSHomeDirectory() stringByAppendingString:@"/Documents/"]stringByAppendingString:path];
    
    view.image = [[UIImage alloc]initWithContentsOfFile:fullpath];


    UIBarButtonItem * delete = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem = delete;
    [self.view addSubview:view];
}
- (void)click{
    FirstOper * oper = [[FirstOper alloc]init];
    FirstDanLi * fdanli = [FirstDanLi firstdanli];
    Anniudanli * adanli = [Anniudanli anniudanli];
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    arr = [oper selectpicfrompicture:fdanli.first];
    [oper deletepic:arr tag:adanli.tag];
    [arr removeObjectAtIndex:adanli.tag];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
