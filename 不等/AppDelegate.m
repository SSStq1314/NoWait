//
//  AppDelegate.m
//  不等
//
//  Created by 璐璐璐、 on 16/5/17.
//  Copyright © 2016年 中软国际011. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FristComeViewController.h"
#import "HomeViewController.h"
#import "AddViewController.h"
#import "MyViewController.h"
#import "mima1ViewController.h"
#import "OperPwd.h"
#import "passDl.h"
@interface AppDelegate ()<UITabBarControllerDelegate>{
    
    UITabBarController * tab;
}



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    OperPwd* op=[[OperPwd alloc]init];
    NSString* str=[op select];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ss) name:@"begin" object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
    bool c=  [[NSUserDefaults standardUserDefaults]boolForKey:@"first"];
    if (!c) {
        FristComeViewController * fristCome = [[FristComeViewController alloc]init];
        self.window.rootViewController = fristCome;
        [[NSUserDefaults standardUserDefaults]setBool:true forKey:@"first"];
    }else{
        if (str!=nil) {
            passDl* op=[passDl passDlInstance];
            op.pass=str;
            NSLog(@"%@",str);
            mima1ViewController *mima = [[mima1ViewController alloc]init];
            self.window.rootViewController = mima;
            
        }else{
            MainViewController *main = [[MainViewController alloc]init];
            self.window.rootViewController = main;
        }
    }
    
    return YES;
}
- (void)ss{
    MainViewController *main = [[MainViewController alloc]init];
    self.window.rootViewController = main;
    
}- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
