//
//  SheZhiViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "SheZhiViewController.h"
#import "SecretCodeTableViewCell.h"
#import "mima2ViewController.h"
#import "Pwd.h"
#import "passDl.h"
#define wfit [UIScreen mainScreen].bounds.size.width/375
#define hfit [UIScreen mainScreen].bounds.size.height/667
@interface SheZhiViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSString* str;
    SecretCodeTableViewCell* cell;
}

@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _op=[[OperPwd alloc]init];
    UITableView* tview=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tview.dataSource=self;
    tview.delegate=self;
    tview.rowHeight = 80*hfit;
    [self.view addSubview:tview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ide=@"ide";
    cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"SecretCodeTableViewCell" owner:self options:nil][0];
    }
    if (str!=nil) {
        cell.swi.on=YES;
    }else{
        cell.swi.on=NO;
        NSLog(@"no");
    }
    [cell.swi addTarget:self action:@selector(secretCode:) forControlEvents:UIControlEventValueChanged];
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    passDl* dl=[passDl passDlInstance];
    str=dl.pass;
    if (str!=nil) {
        cell.swi.on=YES;
    }else{
        cell.swi.on=NO;
    }
}
-(void)secretCode:(UISwitch*)swi{
    if (swi.on) {
        mima2ViewController* mima=[[mima2ViewController alloc]init];
        [self.navigationController pushViewController:mima animated:YES];
    }else{
        [_op deletePwd];
        passDl* dl=[passDl passDlInstance];
        dl.pass=nil;
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
