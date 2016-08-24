//
//  SpotColorViewController.m
//  不等
//
//  Created by li on 16/5/19.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "SpotColorViewController.h"
#import "ColorViewController.h"
#import "SpotDl.h"
@interface SpotColorViewController (){
    int t;
    int k;
}

@end

@implementation SpotColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ColorViewController* color=[[ColorViewController alloc]init];
    for (int i=1; i<=6; i++) {
        UIView* vv=[color.view viewWithTag:i];
        UIButton* but=[self.view viewWithTag:i];
        but.backgroundColor=vv.backgroundColor;
        but.layer.cornerRadius=25;
        but.superview.layer.cornerRadius=30;
    }
    SpotDl* sp=[SpotDl spotDlInstance];
    t=[sp.la.spotColor intValue];
    UIButton* but=[self.view viewWithTag:t];
    but.superview.backgroundColor=[UIColor lightGrayColor];
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
    UIButton* but=[self.view viewWithTag:t];
    but.superview.backgroundColor=[UIColor clearColor];
    sender.superview.backgroundColor=[UIColor lightGrayColor];
    t=(int)sender.tag;
    k=(int)sender.tag;
}

- (IBAction)alter:(UIButton *)sender {
    SpotDl* sp=[SpotDl spotDlInstance];
    sp.la.spotColor=[NSNumber numberWithInt:k];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
