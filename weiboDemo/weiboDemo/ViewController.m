//
//  ViewController.m
//  weiboDemo
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "WeiboSDK.h"
#import "Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)login:(id)sender {
    //发送认证请求
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRidericateURI;//回调地址
    request.scope = @"all";
//    request.userInfo
    
    //发送请求
    [WeiboSDK sendRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
