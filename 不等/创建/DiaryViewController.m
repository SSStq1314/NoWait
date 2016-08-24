//
//  DiaryViewController.m
//  不等
//
//  Created by li on 16/5/23.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "DiaryViewController.h"
#import "Content.h"
#import "AddOper.h"
@interface DiaryViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    AddOper* op;
    UIImagePickerController* pic;
    NSMutableArray* arr;
}

@end

@implementation DiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initdate];
    _add1.layer.cornerRadius=15;
    _add2.layer.cornerRadius=15;
    _add3.layer.cornerRadius=15;
    _add4.layer.cornerRadius=15;
    arr=[[NSMutableArray alloc]init];
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(store)];
    self.navigationItem.rightBarButtonItem=item;
    _weather.delegate=self;
    _weather.returnKeyType=UIReturnKeyDone;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
-(void)initdate{
    NSDate * date=[[NSDate alloc]init];
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSString* datestr=[formatter stringFromDate:date];
    _date.text=datestr;
}
-(void)store{
    if ([_content.text isEqualToString:@""]) {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"请输入内容" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        op=[[AddOper alloc]init];
        Content* con=[[Content alloc]initWithWord:_content.text Date:_date.text TextFont:[NSNumber numberWithInt:16] BackGround:@"123" Label:@"日记" ImaArr:arr  Weather:_weather.text];
        BOOL b=[op inseContent:con];
        if (b) {
            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:YES];
            }]];
            [self presentViewController:alert animated:YES completion:^{
                NSLog(@"%lu",(unsigned long)arr.count);
                for (int i=0; i<arr.count; i++) {
                    switch (i) {
                        case 0:
                            [self saveImage:_ima1.image WithName:arr[i]];
                            break;
                        case 1:
                            [self saveImage:_ima2.image WithName:arr[i]];
                            break;
                        case 2:
                            [self saveImage:_ima3.image WithName:arr[i]];
                            break;
                        case 3:
                            [self saveImage:_ima4.image WithName:arr[i]];
                            break;
                    }
                }
            }];
        }else{
            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
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
- (void)saveImage:(UIImage*)currentImage WithName:(NSString*)imageName{
    NSData* imaData=UIImageJPEGRepresentation(currentImage, 0.5);
    NSString* full=[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:imageName];
    NSLog(@"%@",full);
    [imaData writeToFile:full atomically:NO];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage* img=info[@"UIImagePickerControllerEditedImage"];
    if (_ima1.image == nil) {
        _ima1.image=img;
        _add1.hidden=YES;
        _add2.hidden=NO;
    }else if (_ima2.image == nil){
        _ima2.image=img;
        _add2.hidden=YES;
        _add3.hidden=NO;
    }else if (_ima3.image == nil){
        _ima3.image=img;
        _add3.hidden=YES;
        _add4.hidden=NO;
    }else{
        _ima4.image=img;
        _add4.hidden=YES;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    NSDate * date=[[NSDate alloc]init];
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd-HH-mm-ss"];
    NSString* datestr=[formatter stringFromDate:date];
    [arr addObject:datestr];
}
- (IBAction)click:(UIButton *)sender {
    pic=[[UIImagePickerController alloc]init];
    UIAlertController* ale=[UIAlertController alertControllerWithTitle:@"提示" message:@"请选择图片来源" preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:ale animated:YES completion:nil];
    UIAlertAction* action1=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self getPic:UIImagePickerControllerSourceTypeCamera];
        }else{
            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"暂时无法从相机读取" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    UIAlertAction* action2=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            [self getPic:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        }else{
            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"暂时无法从相册读取" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    UIAlertAction* action3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ale addAction:action1];
    [ale addAction:action2];
    [ale addAction:action3];
}
- (void)getPic:(UIImagePickerControllerSourceType)type{
    [pic setSourceType:type];
    pic.allowsEditing=YES;
    pic.delegate=self;
    [self presentViewController:pic animated:YES completion:nil];
}
@end
