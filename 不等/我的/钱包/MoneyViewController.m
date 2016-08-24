//
//  MoneyViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/18.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "MoneyViewController.h"
#import "MoneyTableViewCell.h"
#import "monyeOper.h"
#import "money.h"
#import "WriteViewController.h"
#import "Footview.h"
@interface MoneyViewController ()<UITableViewDelegate,UITableViewDataSource,FootViewDelegate>{
    NSArray *arr;
    Footview *f;
}

@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"记账";
    _tview.delegate = self;
    _tview.dataSource = self;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem = item;
    monyeOper * oper = [[monyeOper alloc]init];
    arr = [oper selectAll];
    _tview.rowHeight = 110;
    f = [[[NSBundle mainBundle]loadNibNamed:@"FootView" owner:self options:nil]objectAtIndex:0];
    f.delegate = self;
    _tview.tableFooterView = f;
    
}

- (void)footViewUpdata:(Footview *)footview{
    [footview show];
}



- (void)click{

    WriteViewController *w = [[WriteViewController alloc]init];
    [self.navigationController pushViewController:w animated:YES];
    [f show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)viewWillAppear:(BOOL)animated{
    monyeOper * oper = [[monyeOper alloc]init];
    arr = [oper selectAll];
    [_tview reloadData];
    [f show];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide=@"ide";
    MoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MoneyTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    Money *m = arr[indexPath.row];
    cell.money.text = [NSString stringWithFormat:@"%@",m.money];
    cell.type.text = m.type;
    cell.mark.text = m.mark;
    cell.date.text = m.date;
    
    cell.date.lineBreakMode = NSLineBreakByCharWrapping;
    cell.date.numberOfLines = 0;
    CGSize size = [cell.date sizeThatFits:CGSizeMake(cell.date.frame.size.width, MAXFLOAT)];
    cell.date.frame = CGRectMake(cell.date.frame.origin.x,cell.date.frame.origin.y,cell.date.frame.size.width, size.height);
    
    //cell.name.textColor = [UIColor grayColor];
    //cell.detail.text = [NSString stringWithFormat:@"%@人已购买",[dic valueForKey:@"buyCount"]];
    
    return cell;
}















- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Money *m = arr[indexPath.row];
        monyeOper *mo = [[monyeOper alloc]init];
        [mo delete:m.date];
        NSMutableArray *arr1 = [arr mutableCopy];
        [arr1 removeObjectAtIndex:indexPath.row];
        arr = [arr1 copy];
        [_tview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }else if (editingStyle == UITableViewCellEditingStyleInsert){}
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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
