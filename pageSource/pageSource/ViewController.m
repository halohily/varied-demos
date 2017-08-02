//
//  ViewController.m
//  pageSource
//
//  Created by 刘毅 on 2017/8/1.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "ViewController.h"
#import "LYWebView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LYWebView *webview = [[LYWebView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 40)];
    [self.view addSubview:webview];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://portal.3g.qq.com/?aid=index&g_ut=3"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
