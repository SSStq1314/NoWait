//
//  YiJianViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "YiJianViewController.h"

@interface YiJianViewController ()<UITextViewDelegate>

@end

@implementation YiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(wancheng)];
    self.navigationItem.rightBarButtonItem = item;
    _yijian.delegate = self;

    self.automaticallyAdjustsScrollViewInsets = NO;
    _yijian.layer.borderColor = [[UIColor blackColor]CGColor];
    _yijian.layer.borderWidth = 0.6f;
    _yijian.layer.cornerRadius = 5;
}


- (void)wancheng{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定提交" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
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
