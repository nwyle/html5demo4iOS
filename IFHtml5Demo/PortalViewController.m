//
//  PortalViewController.m
//  IFHtml5Demo
//
//  Created by WeiYanglu on 16/5/11.
//  Copyright © 2016年 WeiYanglu. All rights reserved.
//  首页，会有2个UIWebView展示2张报表
//

#import "PortalViewController.h"
#import "WebViewJavascriptBridge.h"
#import "Html5ReportWebView.h"

@interface PortalViewController () <UIWebViewDelegate, WebViewHyperLinkDelegate>

@end

@implementation PortalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帆软Html5集成Demo";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
    
    NSString *url = @"http://env.finedevelop.com:56109/h5test/ReportServer?reportlet=nongxin/zhuxingtu.cpt&op=h5";
    
    Html5ReportWebView *webView = [[Html5ReportWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andUrl:url];
    
    webView.hyperLinkDelegate = self;
    
    [self.view addSubview:webView];

}

- (void) pushViewController:(UIViewController *)viewController withAnimate:(BOOL)animate {
    [self.navigationController pushViewController:viewController animated:animate];
}

@end
