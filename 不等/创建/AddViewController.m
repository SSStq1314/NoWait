//
//  AddViewController.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "AddViewController.h"
#import "AddTableViewCell.h"
#import "ColorViewController.h"
#import "AddLabelViewController.h"
#import "Label.h"
#import "Dl.h"
#import "SpotColorViewController.h"
#import "SpotDl.h"
#import "LabelDl.h"
#import "OtherViewController.h"
#import "DiaryViewController.h"
#import "ScrawlViewController.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface AddViewController ()<UITableViewDataSource,UITableViewDelegate,cutInterfaceDelegate>{
    NSMutableArray* arr;
    UITableView* tview;
    UIBarButtonItem* item;
    NSInteger j;
}

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tview=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tview.dataSource=self;
    tview.delegate=self;
    tview.rowHeight=80;
    [self initData];
    [self initbar];
}
-(void)initData{
    _op=[[AddOper alloc]init];
    arr=[[NSMutableArray alloc]init];
    arr=[_op labelAll];
}
-(void)initbar{
    item=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click)];
    [self.view addSubview:tview];
    self.navigationItem.rightBarButtonItem=item;
    self.navigationItem.leftBarButtonItem=item1;
}
-(void)click{
    AddLabelViewController* add=[[AddLabelViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}
-(void)edit{
    if ([tview isEditing]) {
        [tview setEditing:NO animated:YES];
        item.title=@"编辑";
        self.tabBarController.tabBar.hidden=NO;
    }else{
        [tview setEditing:YES animated:YES];
        item.title=@"完成";
        self.tabBarController.tabBar.hidden=YES;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    Dl* dl=[Dl DlInstance];
    if (dl.la!=nil) {
        BOOL b=YES;
        for (int i=0; i<arr.count; i++) {
            Label* la=arr[i];
            if ([dl.la.labelName isEqualToString:la.labelName]) {
                b=NO;
            }
        }
        if (b) {
            [arr addObject:dl.la];
            [tview reloadData];
            [_op inse:dl.la];
            dl.la=nil;
        }else{
            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"标签名重复" message:@"添加失败" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    SpotDl* sp=[SpotDl spotDlInstance];
    if (sp.la!=nil) {
        Label* la=arr[j];
        la.spotColor=sp.la.spotColor;
        arr[j]=la;
        NSIndexPath* p=[NSIndexPath indexPathForItem:j inSection:0];
        [tview reloadRowsAtIndexPaths:@[p] withRowAnimation:UITableViewRowAnimationFade];
        [_op update:la];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    Label* la=arr[indexPath.row];
    [_op dele:la.labelName];
    [arr removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0||indexPath.row==1) {
        return UITableViewCellEditingStyleNone;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}
-(void)cutInterface:(UIButton*)but{
    SpotDl* dl=[SpotDl spotDlInstance];
    Label* la=arr[but.tag];
    j=but.tag;
    dl.la=la;
    SpotColorViewController* spot=[[SpotColorViewController alloc]init];
    [self.navigationController pushViewController:spot animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        DiaryViewController* diary=[[DiaryViewController alloc]init];
        [self.navigationController pushViewController:diary animated:YES];
    }else if (indexPath.row==1){
        ScrawlViewController* scrawl=[[ScrawlViewController alloc]init];
        [self.navigationController pushViewController:scrawl animated:YES];
    }else {
        Label* la=arr[indexPath.row];
        LabelDl* dl=[LabelDl labelDlInstance];
        dl.la=la.labelName;
        OtherViewController* other=[[OtherViewController alloc]init];
        [self.navigationController pushViewController:other animated:YES];
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ide=@"ide";
    AddTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"AddTableViewCell" owner:self options:nil][0];
    }
    Label* la=arr[indexPath.row];
    ColorViewController* color=[[ColorViewController alloc]init];
    UIView* vv=[color.view viewWithTag:[la.spotColor intValue]];
    cell.spot.tag=indexPath.row;
    cell.spot.backgroundColor=vv.backgroundColor;
    cell.name.text=la.labelName;
    cell.dele=self;
    return cell;
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
