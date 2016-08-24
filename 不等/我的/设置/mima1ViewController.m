//
//  mima1ViewController.m
//  SecretCode
//
//  Created by li on 16/5/26.
//  Copyright © 2016年 中软国际013. All rights reserved.
//

#import "mima1ViewController.h"
#import "passDl.h"
@interface mima1ViewController (){
    NSString* str1;
    NSString* str2;
}

@end

@implementation mima1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    str1=[[NSString alloc]init];
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
            passDl* op=[passDl passDlInstance];
            str2=op.pass;
            if ([str1 isEqualToString:str2]) {
                [[NSNotificationCenter defaultCenter ]postNotificationName:@"begin" object:nil];
            }else{
                [self bright];
                _la.text=@"密码错误，请重新输入";
                str1=@"";
            }
        }
    }
}

- (IBAction)dele:(UIButton *)sender {
    UIView* v=[self.view viewWithTag:[str1 length]];
    v.hidden=NO;
    if (str1.length!=0) {
        str1=[str1 substringToIndex:str1.length-1];
    }
}
@end
