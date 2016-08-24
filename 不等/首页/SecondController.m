//
//  SecondController.m
//  不等
//
//  Created by 中软国际新014 on 16/5/19.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "SecondController.h"
#import "pictureViewController.h"
#import "Anniudanli.h"
#import "FirstOper.h"
#import "First.h"
#import "FirstDanLi.h"
#import "ChangeWordViewController.h"
#define xfit [UIScreen mainScreen].bounds.size.width/375
#define yfit [UIScreen mainScreen].bounds.size.height/667
@interface SecondController ()<UITextViewDelegate>{
    UILabel * labtext;
    UIButton * vbut;
    FirstDanLi * danli;
    UILabel * labdate;
    UIButton * but;
    First * first;
}

@end
@implementation SecondController

- (void)viewWillAppear:(BOOL)animated{
    
    
    FirstOper * oper = [[FirstOper alloc]init];
    first = [oper selectFirst:danli.first];
    NSArray * arr =  [oper selectpicfrompicture:danli.first];
    CGFloat fontww = [danli.first.textfont floatValue];
    UIFont * fontt =  [UIFont systemFontOfSize:fontww];
    
    NSDictionary * td = @{NSFontAttributeName:fontt};
    CGSize tsize = [danli.first.word boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:td context:nil].size;
    
    if (arr.count == 0) {
        labtext.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, (tsize.height+200)*yfit);
        
        
        labtext.numberOfLines = 0;
        
        labdate.frame = CGRectMake(295*xfit, (labtext.bounds.size.height+180)*yfit, 80*xfit, 20*yfit);
         but.frame = labtext.frame;
       
        [self.view addSubview:but];
        [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:labdate];
        [self.view addSubview:labtext];
        
    }else{
        NSLog(@"%@",arr);
        for (int i = 0; i < arr.count; i++){
            
            vbut = [[UIButton alloc]initWithFrame:CGRectMake(i*95*xfit,70*yfit, 90*xfit, 100*yfit)];
            vbut.tag = i;
            [self.view addSubview:vbut];
            
            [vbut addTarget:self action:@selector(viewclick:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(i*95*xfit, 70*yfit, 90*xfit, 100*yfit)];
            NSString * path  = arr[i];
            
            NSString* fullpath=[[NSHomeDirectory() stringByAppendingString:@"/Documents/"]stringByAppendingString:path];
            
            view.image = [[UIImage alloc]initWithContentsOfFile:fullpath];
            
            [self.view addSubview:view];
            
            
        }
        
        labtext.frame = CGRectMake(0, 170*yfit, [UIScreen mainScreen].bounds.size.width, (tsize.height+200)*yfit);
        but.frame = labtext.frame;
        [self.view addSubview:but];
        
        [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
       
        labtext.numberOfLines = 0;
        [self.view addSubview:labtext];
        labdate.frame = CGRectMake(295*xfit, (labtext.bounds.size.height+220)*yfit, 80*xfit, 20*yfit);
        
        [self.view addSubview:labdate];
        
        
    }
    
   
    danli.first = first;
    labtext.text = danli.first.word;
    CGFloat font = [danli.first.textfont floatValue];
    labtext.font = [UIFont systemFontOfSize:font];
    labdate.font = [UIFont systemFontOfSize:8];
    labdate.text = danli.first.data;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setToolbarHidden:NO];
    self.navigationController.toolbar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-45*yfit, [UIScreen mainScreen].bounds.size.width, 45*yfit);
    UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    //  组建不是为了显示实现功能， 只为了使间距一样
    UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    if ([first.shoucang intValue] == 1) {
        UIBarButtonItem * shoucang = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"heart52.png"]  style:UIBarButtonItemStyleDone target:self action:@selector(changeshou:)];
        self.toolbarItems = @[im4,it,shoucang,it];
    }else{
        UIBarButtonItem * shoucang = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"heart58.png"]  style:UIBarButtonItemStyleDone target:self action:@selector(changeshou:)];
        self.toolbarItems = @[im4,it,shoucang,it];
    }
    
 }
- (void)changeshou:(UIBarButtonItem *)shou{
    FirstOper * oper = [[FirstOper alloc]init];
    NSLog(@"%@",first.shoucang);
    if ([first.shoucang intValue]== 1) {
        [oper updateshoucang:first shou:[NSNumber numberWithInt:0]];
        first.shoucang = [NSNumber numberWithInt:0];
        shou.image = [UIImage imageNamed:@"heart58"];
    }else{
        [oper updateshoucang:first shou:[NSNumber numberWithInt:1]];
        first.shoucang = [NSNumber numberWithInt:1];
        shou.image = [UIImage imageNamed:@"heart52"];
    }

}
- (void)viewWillDisappear:(BOOL)animated{
     self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setToolbarHidden:NO];
    self.navigationController.toolbar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-45*yfit, [UIScreen mainScreen].bounds.size.width, 45*yfit);
    
    UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    //  组建不是为了显示实现功能， 只为了使间距一样
    UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[im4,it,it,it,it];
    danli = [FirstDanLi firstdanli];
    FirstOper * oper = [[FirstOper alloc]init];
    NSArray * arr =  [oper selectpicfrompicture:danli.first];
    CGFloat fontww = [danli.first.textfont floatValue];
    UIFont * font =  [UIFont systemFontOfSize:fontww];
    
    NSDictionary * td = @{NSFontAttributeName:font};
    CGSize tsize = [danli.first.word boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:td context:nil].size;
    if (arr.count == 0) {
        labtext = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, (tsize.height+200)*yfit)];
        
        
        CGFloat font = [danli.first.textfont floatValue];
        labtext.font = [UIFont systemFontOfSize:font];
        
      
        labtext.text = danli.first.word;
        labtext.numberOfLines = 0;
        
        labdate = [[UILabel alloc]initWithFrame:CGRectMake(295*xfit, (labtext.bounds.size.height+180)*yfit, 80*xfit, 20*yfit)];
        labdate.font = [UIFont systemFontOfSize:8];
        labdate.text = danli.first.data;
        but = [[UIButton alloc]initWithFrame:labtext.frame];
        [self.view addSubview:but];
 
        [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:labdate];
        [self.view addSubview:labtext];
        
    }else{
         NSLog(@"%@",arr);
        for (int i = 0; i < arr.count; i++){
            
            vbut = [[UIButton alloc]initWithFrame:CGRectMake(i*95*xfit,70*yfit, 90*xfit, 100*yfit)];
            vbut.tag = i;
            [self.view addSubview:vbut];
            
            [vbut addTarget:self action:@selector(viewclick:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(i*95*xfit, 70*yfit, 90*xfit, 100*yfit)];
            NSString * path  = arr[i];
            
            NSString* fullpath=[[NSHomeDirectory() stringByAppendingString:@"/Documents/"]stringByAppendingString:path];
            
            view.image = [[UIImage alloc]initWithContentsOfFile:fullpath];
            
            [self.view addSubview:view];
            
            
        }
        
        labtext = [[UILabel alloc]initWithFrame:CGRectMake(0, 170*yfit, [UIScreen mainScreen].bounds.size.width, (tsize.height+200)*yfit)];
        but = [[UIButton alloc]initWithFrame:labtext.frame];
        [self.view addSubview:but];
        
        [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        labtext.text = danli.first.word;
        CGFloat font = [danli.first.textfont floatValue];
        labtext.font = [UIFont systemFontOfSize:font];
        labtext.numberOfLines = 0;
        [self.view addSubview:labtext];
        labdate = [[UILabel alloc]initWithFrame:CGRectMake(295*xfit, (labtext.bounds.size.height+220)*yfit, 80*xfit, 20*yfit)];
        labdate.font = [UIFont systemFontOfSize:8];
        labdate.text = danli.first.data;
        [self.view addSubview:labdate];
        
        
    }
    
    


    
    
}

- (void)back{
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewclick:(UIButton *)butt{
    Anniudanli * a = [Anniudanli anniudanli];
    a.tag =(int) butt.tag;
    pictureViewController * pic = [[pictureViewController alloc]init];
    [self.navigationController pushViewController:pic animated:YES];
}


- (void)click{

    ChangeWordViewController * sec = [[ChangeWordViewController alloc]init];
    [self.navigationController pushViewController:sec animated:YES];
  
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
