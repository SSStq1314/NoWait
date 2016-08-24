//
//  mima2ViewController.m
//  SecretCode
//
//  Created by li on 16/5/26.
//  Copyright © 2016年 中软国际013. All rights reserved.
//

#import "mima2ViewController.h"
#import "passDl.h"
@interface mima2ViewController (){
    NSString* str1;
    NSString* str2;
}

@end

@implementation mima2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _op=[[OperPwd alloc]init];
    str1=[[NSString alloc]init];
    str2=[[NSString alloc]init];
    for (int i=1; i<=8; i++) {
        UIView* vv=[self.view viewWithTag:i];
        if (i<=4) {
            vv.layer.cornerRadius=5;
        }else{
            vv.layer.cornerRadius=7;
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
- (void)bright{
    for (int i=1; i<=4; i++) {
        UIView* vv=[self.view viewWithTag:i];
        vv.hidden=NO;
    }
}
- (IBAction)click:(UIButton *)sender {
    if (str1.length<=3) {
        str1=[str1 stringByAppendingString:sender.titleLabel.text];
        UIView* v=[self.view viewWithTag:[str1 length]];
        v.hidden=YES;
        if (str1.length==4) {
            [self bright];
            _la.text=@"请再次输入密码";
        }
    }else if (str2.length<=3){
        str2=[str2 stringByAppendingString:sender.titleLabel.text];
        UIView* v=[self.view viewWithTag:[str2 length]];
        v.hidden=YES;
        if (str2.length==4) {
            if ([str1 isEqualToString:str2]) {
                [_op inserPwd:str1];
                passDl* dl=[passDl passDlInstance];
                dl.pass=str1;
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [self bright];
                _la.text=@"输入错误，请重新输入";
                str2=@"";
            }
        }
    }
}

- (IBAction)dele:(UIButton *)sender {
    if (str1.length<4) {
        UIView* v=[self.view viewWithTag:[str1 length]];
        v.hidden=NO;
        if (str1.length!=0) {
            str1=[str1 substringToIndex:str1.length-1];
        }
    }else{
        UIView* v=[self.view viewWithTag:[str2 length]];
        v.hidden=NO;
        if (str2.length!=0) {
            str2=[str2 substringToIndex:str2.length-1];
        }
    }
}
@end
