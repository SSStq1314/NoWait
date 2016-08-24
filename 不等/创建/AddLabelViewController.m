//
//  AddLabelViewController.m
//  不等
//
//  Created by li on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "AddLabelViewController.h"
#import "Label.h"
#import "ColorViewController.h"
#import "Dl.h"
@interface AddLabelViewController ()<UITextFieldDelegate>{
    int t;
    int k;
}

@end

@implementation AddLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ColorViewController* color=[[ColorViewController alloc]init];
    for (int i=1; i<=6; i++) {
        UIButton* but=[self.view viewWithTag:i];
        UIView* vv=[color.view viewWithTag:i];
        but.backgroundColor=vv.backgroundColor;
        but.layer.cornerRadius=25;
        but.superview.layer.cornerRadius=30;
    }
    _text.delegate=self;
    _text.returnKeyType=UIReturnKeyDone;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
    if (t!=0) {
        UIView* vv=[self.view viewWithTag:t];
        vv.backgroundColor=[UIColor clearColor];
    }
    
    sender.superview.backgroundColor=[UIColor lightGrayColor];
    t=(int)sender.superview.tag;
    k=(int)sender.tag;
}

- (IBAction)add:(UIButton *)sender {
    if (t==0) {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"请选择标签颜色" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([_text.text isEqualToString:@""]){
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"请输入标签名" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        Label* la=[[Label alloc]initWithSpotColor:[NSNumber numberWithInt:k] LabelName:_text.text];
        Dl* dl=[Dl DlInstance];
        dl.la=la;
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
