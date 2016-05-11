//
//  Html5ReportWebView.m
//  IFHtml5Demo
//
//  Created by WeiYanglu on 16/5/11.
//  Copyright © 2016年 WeiYanglu. All rights reserved.

//这是一个能和前端html通信的webView类，自带WebViewJavascriptBridge
//

#import "Html5ReportWebView.h"
#import "WebViewJavascriptBridge.h"

@interface Html5ReportWebView() <UIWebViewDelegate> {
    WebViewJavascriptBridge *bridge;
}

@end

@implementation Html5ReportWebView

- (id) initWithFrame:(CGRect)frame andUrl:(NSString *) url {
    self = [super initWithFrame:frame];
    if(self) {
        bridge = [WebViewJavascriptBridge bridgeForWebView:self];
        [bridge setWebViewDelegate:self];
        //注意这里的handler名字一定要和html里定义的一致，必须是hyperLinkHandler
        [bridge registerHandler:@"hyperLinkHandler" handler:^(id data, WVJBResponseCallback responseCallback) {
            [self doHyper:data];
        }];
        [self loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]]];
    }
    return self;
}

//这个方法里处理超链请求，参数url就是超链的地址
- (void) doHyper: (NSString *) url {
    Html5ReportWebView *linkView = [[Html5ReportWebView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600) andUrl:url];
    UIViewController *linkViewController = [[UIViewController alloc] init];
    linkViewController.view.backgroundColor = [UIColor whiteColor];
    [linkViewController.view addSubview:linkView];
    [self.hyperLinkDelegate pushViewController:linkViewController withAnimate:YES];
}

@end
