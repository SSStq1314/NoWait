//
//  MainViewController.m
//  不等
//
//  Created by sgsgsg on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "AddViewController.h"
#import "MyViewController.h"

@interface MainViewController (){
    UIView * tview;
    
}


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *home =[[HomeViewController alloc]init];
    [self setChildController:home title:@"首页" imageName:@"home"  selectName:@"home"];
    
    AddViewController *add = [[AddViewController alloc]init];
    [self setChildController:add title:@"日记" imageName:@"add" selectName:@"add"];
    
    MyViewController *my = [[MyViewController alloc]init];
    [self setChildController:my title:@"我的" imageName:@"my" selectName:@"my"];
    

        
    }




- (void)setChildController:(UIViewController *)ctl title:(NSString *)title imageName:(NSString *)imageName selectName:(NSString *)selectName{
    
    ctl.title = title;
    ctl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctl.tabBarItem.selectedImage = [UIImage imageNamed:selectName];
    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:ctl];
    [self addChildViewController:na];
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
