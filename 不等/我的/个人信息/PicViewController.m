//
//  PicViewController.m
//  不等
//
//  Created by li on 16/5/27.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "PicViewController.h"
#import "Oper.h"
#import "imageDl.h"
@interface PicViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i=1; i<=8; i++) {
        UIButton* but=[self.view viewWithTag:i];
        [but setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"IMG_000%d.jpg",i+1]] forState:UIControlStateNormal];
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

- (IBAction)click:(UIButton *)sender {
    NSString* str=[NSString stringWithFormat:@"IMG_000%d.jpg",(int)sender.tag+1];
    imageDl* dl=[imageDl imageDlInstance];
    dl.str=str;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
