//
//  FristComeViewController.m
//  不等
//
//  Created by ssstq1314 on 16/5/19.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "FristComeViewController.h"
#import "FirstOper.h"
#define wfit [UIScreen mainScreen].bounds.size.width/375
#define hfit [UIScreen mainScreen].bounds.size.height/667

@interface FristComeViewController ()<UIScrollViewDelegate>{
    UIPageControl *page;
    UIScrollView *scroll;
    bool b;
}
@end

@implementation FristComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    FirstOper * oper = [[FirstOper alloc]init];
    [oper firstCome];
    b = false;
    scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    for (int i = 0;  i < 4; i++) {
        NSString * name = [NSString stringWithFormat:@"IMG_001%d.jpg",i+5];
        
        UIImageView * view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        view.frame = CGRectMake(i*375*wfit, 0, 375*wfit, 667*hfit);
        [scroll addSubview:view];
        
    }
    scroll.contentSize = CGSizeMake(4*375*wfit, 667*hfit);
    [self.view addSubview:scroll];
    scroll.pagingEnabled = YES;
    scroll.delegate = self;
    
    //    page = [[UIPageControl alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/2), 620*hfit, 160*wfit, 40*hfit)];
    //    page.numberOfPages =4;
    //    [self.view addSubview:page];
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake((3*375+90)*wfit, 600*hfit, 200*wfit, 30*hfit)];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    btn.layer.cornerRadius=4;
    [btn setTitle:@"开始记录我的生活" forState:UIControlStateNormal];
    [scroll addSubview:btn];
    [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    page.currentPage= scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
}
- (void)start{
    
    
   
    [[NSNotificationCenter defaultCenter ]postNotificationName:@"begin" object:nil];
   
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
