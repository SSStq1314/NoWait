//
//  ChangeWordViewController.m
//  不等
//
//  Created by ssstq1314 on 16/5/24.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "ChangeWordViewController.h"
#import "FirstDanLi.h"
#import "FirstOper.h"
#import "ChangeWord.h"

#define xfit [UIScreen mainScreen].bounds.size.width/375
#define yfit [UIScreen mainScreen].bounds.size.height/667

@interface ChangeWordViewController ()<UITextViewDelegate,ChangeWordDelegat>{
    
    UITextView * field;
   
    UIControl * wordCrol;
}


@end
static BOOL keyboar = NO;
static BOOL wordkey = YES;
@implementation ChangeWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem * itm = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = itm;
    
    UIBarButtonItem * itm1 = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(sureback)];
    self.navigationItem.rightBarButtonItem = itm1;
    
    
    [self.navigationController setToolbarHidden:NO];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.toolbar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-60*yfit, [UIScreen mainScreen].bounds.size.width, 60*yfit);
    [self SetTooBar];
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
    
    FirstDanLi * danli = [[FirstDanLi alloc]init];
    danli = [FirstDanLi firstdanli];
    
    
    field = [[UITextView alloc]initWithFrame:CGRectMake(0, 15*yfit, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height )];
    
 
    field.text = danli.first.word;

   

    
    CGFloat font = [danli.first.textfont floatValue];
    field.font = [UIFont systemFontOfSize:font];
    
    
    
    [self.view addSubview:field];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)changeTextSize:(ChangeWord *)changeWord{
    
    CGFloat font = changeWord.slider.value;
    field.font = [UIFont systemFontOfSize:font];
    
}

- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    //键盘高度
    [self.navigationController setToolbarHidden:NO];
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
     self.navigationController.toolbar.frame = CGRectMake(0, (keyBoardFrame.size.height+50*yfit)*yfit, [UIScreen mainScreen].bounds.size.width, 60*yfit);
    UIBarButtonItem * im1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"文字"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(word)];
    
    UIBarButtonItem * im2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"信纸"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(xinzhi)];
    
    UIBarButtonItem * im3 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"照片"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
    
    UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"NO"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(keyBoard)];
    
    //  组建不是为了显示实现功能， 只为了使间距一样
    UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[im1,it,im2,it,im3,it,im4];
    
    keyboar = YES;
    
    
    
}



-(void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    [self.navigationController setToolbarHidden:NO];
    self.navigationController.toolbar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-60*yfit, [UIScreen mainScreen].bounds.size.width, 60*yfit);
    
}



- (void)SetTooBar{
    
    UIBarButtonItem * im1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"文字"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(word)];
    
    UIBarButtonItem * im2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"信纸"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(xinzhi)];
    
    UIBarButtonItem * im3 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"照片"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
    
    UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"YES.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(keyBoard)];
    
    
    //  组建不是为了显示实现功能， 只为了使间距一样
    UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[im1,it,im2,it,im3,it,im4];
    
}


- (void)keyBoard{
    
    if (!wordkey) 
        {
            [self.navigationController setToolbarHidden:NO];
            [_wordView removeFromSuperview];
            [wordCrol removeFromSuperview];
            wordkey = YES;
            
        }

    
    
    if (keyboar) {
        
        
        [field resignFirstResponder];
        [self.navigationController setToolbarHidden:NO];
        UIBarButtonItem * im1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"文字"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(word)];
        
        UIBarButtonItem * im2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"信纸"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(xinzhi)];
        
        UIBarButtonItem * im3 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"照片"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
        
       UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"YES.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(keyBoard)];
        
        //  组建不是为了显示实现功能， 只为了使间距一样
        UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
      self.toolbarItems = @[im1,it,im2,it,im3,it,im4];

        keyboar = NO;
        
        
    }else{
        
        
        
        [field becomeFirstResponder];
        [self.navigationController setToolbarHidden:NO];
        UIBarButtonItem * im1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"文字"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(word)];
        
        UIBarButtonItem * im2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"信纸"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(xinzhi)];
        
        UIBarButtonItem * im3 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"照片"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
        
      UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"NO"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(keyBoard)];
        
        //  组建不是为了显示实现功能， 只为了使间距一样
        UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        self.toolbarItems = @[im1,it,im2,it,im3,it,im4];

        keyboar = YES;
    }
    
    
    
    
}

- (void)photo{
    
    NSLog(@"Camara");
}




- (void)word{
    
    [field resignFirstResponder];
    [self.navigationController setToolbarHidden:NO];
    UIBarButtonItem * im1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"文字"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(word)];
    
    UIBarButtonItem * im2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"信纸"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(xinzhi)];
    
    UIBarButtonItem * im3 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"照片"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
    
    UIBarButtonItem * im4 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"YES.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(keyBoard)];
    
    //  组建不是为了显示实现功能， 只为了使间距一样
    UIBarButtonItem * it = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[im1,it,im2,it,im3,it,im4];
    
    keyboar = NO;

    if (wordkey) {
        
        wordCrol = [[UIControl alloc]initWithFrame:CGRectMake(0, -self.navigationController.navigationBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2+self.navigationController.navigationBar.frame.size.height)];
        
        wordCrol.backgroundColor = [UIColor blackColor];
        wordCrol.alpha = 0.2;
        
        [self.view addSubview:wordCrol];
        
        _wordView = [[[NSBundle mainBundle]loadNibNamed:@"ChangeWord" owner:self options:nil] objectAtIndex:0];
        _wordView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
        _wordView.backgroundColor = [UIColor whiteColor];
       
        
        FirstDanLi * danli = [[FirstDanLi alloc]init];
        danli = [FirstDanLi firstdanli];
        float ff = (float)[danli.first.textfont floatValue];
        self.wordView.slider.value = ff;
        _wordView.wordSize.text = [NSString stringWithFormat:@"%d",(int)ff];
        
        [self.view addSubview:_wordView];
        _wordView.delegate=self;
        wordkey = NO;
     
        NSLog(@"word yes");

    }else{
         [self.navigationController setToolbarHidden:NO];
        [_wordView removeFromSuperview];
        [wordCrol removeFromSuperview];
        wordkey = YES;
        
    }
 
    }



- (void)change:(UISlider *)slider{
    NSLog(@"%f",slider.value);
    
}



- (void)xinzhi{
    
    NSLog(@"xinzhi");
}

- (void)back{
    [self.navigationController setToolbarHidden:YES];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"back");
}
- (void)sureback{
    FirstDanLi * danli = [FirstDanLi firstdanli];
    
    First * first = danli.first;
    first.word = field.text;
    danli.first = first;
    FirstOper * oper = [[FirstOper alloc]init];
    [oper updateNowait:danli.first];
    [self.navigationController setToolbarHidden:YES];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"sureback");
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
