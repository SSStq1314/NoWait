//
//  JieShaoViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "JieShaoViewController.h"
#define w [UIScreen mainScreen].bounds.size.width
#define h [UIScreen mainScreen].bounds.size.height
@interface JieShaoViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *listArray;
}

@end

@implementation JieShaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"功能介绍";
    
    listArray = @[@"  不等",@"操作简单方便易懂，人性化的设置给予用户更多的体验。随手记下、画下你的生活，等许久以后再看时，你会发现生活的美好，有趣。",@"随时记录你的生活中的各种琐事、趣事、杂事。",@"私密日记带给你更加安全的体验。",@"能够设置字体的颜色大小，不在想普通记事本那样枯燥无聊。",@""];
    _table.dataSource = self;
    _table.delegate = self;
    
    
//    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, h-100, w, 100)];
//    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(w/2-40, h-50, 80, 50)];
//    img.image = [UIImage imageNamed:@"闪屏1"];
//    _table.tableFooterView = footer;
//    [footer addSubview:img];
    
}

#pragma 自动计算行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = listArray[indexPath.row];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    CGSize size = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width , CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height+20;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return listArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide = @"ide";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ide];
    }
    cell.textLabel.text = listArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;//自动换行
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
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
