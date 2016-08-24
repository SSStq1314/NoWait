//
//  WriteViewController.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "WriteViewController.h"
#import "monyeOper.h"
#import "money.h"
#define wfit [UIScreen mainScreen].bounds.size.width/375
#define hfit [UIScreen mainScreen].bounds.size.height/667

@interface WriteViewController ()<UITextFieldDelegate>{
    UIDatePicker *dp;
    NSString *type;
}
@end

@implementation WriteViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _date.delegate = self;
    _mark.delegate = self;
    _money.delegate = self;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(click1)];
    self.navigationItem.rightBarButtonItem = item;
    type = @"收入";
    
    
}

- (IBAction)sender:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        type = @"收入";
    }else{
        type = @"支出";
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    dp = [[UIDatePicker alloc]initWithFrame:CGRectMake(15*wfit,390*hfit, 0, 0)];
    dp.datePickerMode = UIDatePickerModeDateAndTime;
    if (textField.tag == 1) {
        
        [self.view addSubview:dp];
        [dp addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        return NO;
    }else{
        dp.hidden = YES;
        [dp removeFromSuperview];
        return YES;
    }
    return YES;
}



- (void)textFieldDidEndEditing:(UITextField *)textField{
    dp.hidden = YES;
}

- (void)dateChanged:(id)sender{
    
    UIDatePicker *control = (UIDatePicker *)sender;
    NSDate *date1 = control.date;
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [df stringFromDate:date1];
    _date.text = str;
}

- (void)click1{
    
    monyeOper *mo = [[monyeOper alloc]init];
    NSNumber * money = [NSNumber numberWithFloat:[_money.text floatValue]];
    NSString * mark = _mark.text;
    NSString * date = _date.text;

    Money *m = [[Money alloc]initWithMoney:money mark:mark date:date type:type];
    [mo insert:m];
    [self.navigationController popViewControllerAnimated:YES];

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
