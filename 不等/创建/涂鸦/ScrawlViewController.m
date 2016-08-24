//
//  ScrawlViewController.m
//  不等
//
//  Created by li on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "ScrawlViewController.h"
#import "UIImage+MJ.h"
@interface ScrawlViewController ()

@end

@implementation ScrawlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithTitle:@"保存到相册" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem=item;
}
-(void)save:(UIBarButtonItem*)item{
    UIImage* ima=[UIImage captureWithView:_scrawl];
    UIImageWriteToSavedPhotosAlbum(ima, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (!error) {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
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
- (IBAction)revoke:(UIButton *)sender {
    [_scrawl revoke];
}

- (IBAction)dele:(UIButton *)sender {
    [_scrawl dele];
}
@end
