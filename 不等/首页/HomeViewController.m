//
//  HomeViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "HomeViewController.h"
#import "SZCalendarPicker.h"
#import "MyTableViewCell.h"
#import "ColorViewController.h"
#import "SecondController.h"
#import "First.h"
#import "FirstOper.h"
#import "FirstDanLi.h"
#define wfit [UIScreen mainScreen].bounds.size.width/375
#define hfit [UIScreen mainScreen].bounds.size.height/667



@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    
    UITableView * table;
    NSArray *array;
    NSArray *arr1;
    NSArray *arr2;
    NSArray *arr3;
    UIBarButtonItem * item2;
    
    NSMutableArray * arr;
    
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40*wfit, 50*hfit)];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40*wfit,50*hfit)];
    [btn setBackgroundImage:[UIImage imageNamed:@"日历"] forState:UIControlStateNormal];
    [view1 addSubview:btn];
    [btn addTarget:self action:@selector(calendar) forControlEvents:UIControlEventTouchUpInside];
    
    item2 = [[UIBarButtonItem alloc]initWithCustomView:view1];
    self.navigationItem.leftBarButtonItem = item2;
    
    
    
    table = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    table.contentInset =  UIEdgeInsetsMake(-self.navigationController.navigationBar.frame.size.height+8*wfit, 0, 0, 0);
    
    
    
    table.rowHeight = 90*hfit;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    

}

- (void)viewWillAppear:(BOOL)animated{
    FirstOper * info = [[FirstOper alloc]init];
    
    arr = [info selectallfromNoWait];
  
    [table reloadData];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setToolbarHidden:YES];
    
}

- (void)calendar{
    {
        SZCalendarPicker *calendarPicker = [SZCalendarPicker showOnView:self.view];
        calendarPicker.today = [NSDate date];
        calendarPicker.date = calendarPicker.today;
        calendarPicker.frame = CGRectMake(0, 100*hfit, self.view.frame.size.width, 352*hfit);
        self.navigationItem.leftBarButtonItem = nil;
        calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
            self.navigationItem.leftBarButtonItem = item2;
            NSLog(@"%li.%li.%li", (long)year,(long)month,(long)day);
        };
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arr.count;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    cell.weather.text=first.weather;
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
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        First * f = arr[indexPath.row];
        NSLog(@"%@",f.word);
        FirstOper * oper = [[FirstOper alloc]init];
        [oper deletefromNowait:f];
        [arr removeObjectAtIndex:indexPath.row];
        [table deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        
    }
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
