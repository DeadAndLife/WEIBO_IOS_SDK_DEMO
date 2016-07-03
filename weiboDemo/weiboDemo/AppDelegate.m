//
//  AppDelegate.m
//  weiboDemo
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "AppDelegate.h"
#import "WeiboSDK.h"
#import "Common.h"

@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate

-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    NSLog(@"%@", response);
    WBAuthorizeResponse *res = (WBAuthorizeResponse *)response;
    NSLog(@"%@", res.accessToken);
    
}
////同一个手机中的应用,相互之间通信的接收方法
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WeiboSDK handleOpenURL:url delegate:self];
}


//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//    
//}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //打开调试模式
    [WeiboSDK enableDebugMode:YES];
    //向SDK注册appkey
    [WeiboSDK registerApp:kAPPKey];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
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
