//
//  HVWHtmlViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWHtmlViewController.h"
#import "HVWHtml.h"

@interface HVWHtmlViewController ()<UIWebViewDelegate>

@end

@implementation HVWHtmlViewController


- (void)loadView {
    // 改变内置view为UIWebView
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


/** 加载数据 */
- (void)setHtml:(HVWHtml *)html {
    _html = html;
    
    // 1.设置标题
    self.title = self.html.title;
    
    // 2.获取UIWebView
    UIWebView *webView = (UIWebView *) self.view;
    // 设置webView代理
    webView.delegate = self;
    
    // 3.创建URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.html.html withExtension:nil];
    
    // 4.创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 5.发送请求
    [webView loadRequest:request];
    
    // 6.添加关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 加载html完毕，跳转到指定部分 */
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 1.合成js代码
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';", self.html.ID];
    
    // 2.执行js代码
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end
