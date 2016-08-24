//
//  ShouCangViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "ShouCangViewController.h"
#import "FirstDanLi.h"
#import "FirstOper.h"
#import "First.h"
#import "MyTableViewCell.h"
#import "ColorViewController.h"
#import "SecondController.h"
@interface ShouCangViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray * arr;
}

@end

@implementation ShouCangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * view = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:view];
    view.dataSource = self;
    view.delegate = self;
    view.rowHeight = 70;
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController setToolbarHidden:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FirstDanLi * danli = [FirstDanLi firstdanli];
    arr = [[NSArray alloc]init];
    FirstOper * oper = [[FirstOper alloc]init];
    arr = [oper selectshou:danli.first];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"str";
    
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    FirstOper * oper = [[FirstOper alloc]init];
    First * first = arr[indexPath.row];
    int i = [oper selectLableColor:first];
    
    cell.text.text = first.word;
    cell.data.text = first.data;
    NSArray * picarr  = [oper selectpicfrompicture:first];
    
    
    if (picarr.count == 0) {
        
        cell.image.image = nil;
    }else{
        
        NSString * path  = picarr[0];
        NSString* fullpath=[[NSHomeDirectory() stringByAppendingString:@"/Documents/"]stringByAppendingString:path];
        NSLog(@"%@",fullpath);
        cell.image.image = [[UIImage alloc]initWithContentsOfFile:fullpath];
        ColorViewController * c = [[ColorViewController alloc]init];
        UIView* vv=[c.view viewWithTag:i];
        cell.color.backgroundColor=vv.backgroundColor;
    }
    
    ColorViewController * c = [[ColorViewController alloc]init];
    UIView* vv=[c.view viewWithTag:i];
    cell.color.backgroundColor=vv.backgroundColor;
    
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstDanLi * danli = [FirstDanLi firstdanli];
    danli.first = arr[indexPath.row];
    SecondController * sec = [[SecondController alloc]init];
    [self.navigationController pushViewController:sec animated:YES];
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
