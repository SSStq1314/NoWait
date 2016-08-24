//
//  GuanYuViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "GuanYuViewController.h"
#import "JieShaoViewController.h"
#define w [UIScreen mainScreen].bounds.size.width
#define wfit [UIScreen mainScreen].bounds.size.width/375
#define hfit [UIScreen mainScreen].bounds.size.height/667
@interface GuanYuViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *arr;
    NSArray *aa;
}

@end

@implementation GuanYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    _tview.dataSource = self;
    _tview.delegate = self;
    arr = [NSArray arrayWithObjects:@"最新版本",@"功能介绍", nil];
    aa = [NSArray arrayWithObjects:@"1.1.0",@"", nil];
    
    
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, w, 200*hfit)];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(w/2-100*wfit/2, 30*hfit, 100*wfit, 100*hfit)];
    img.image = [UIImage imageNamed:@"logo"];
    _tview.tableHeaderView = header;
    [header addSubview:img];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(w/2-100*wfit/2, 150*hfit, 100*wfit, 30*hfit)];
    la.text = @"版本：1.1.0";
    [header addSubview:la];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        JieShaoViewController *jie = [[JieShaoViewController alloc]init];
        [self.navigationController pushViewController:jie animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide = @"ide";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ide];
    }
    cell.textLabel.text = arr[indexPath.row];
    cell.detailTextLabel.text = aa[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
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
