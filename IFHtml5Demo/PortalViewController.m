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
    
    self.view.backgroundColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
    
    NSString *url = @"http://192.168.101.254:8075/WebReport/ReportServer?reportlet=testChart.cpt&op=h5";
    
    Html5ReportWebView *webView1 = [[Html5ReportWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) andUrl:url];
    Html5ReportWebView *webView2 = [[Html5ReportWebView alloc] initWithFrame:CGRectMake(0, 270, self.view.frame.size.width, 250) andUrl:url];
    
    webView1.hyperLinkDelegate = self;
    webView2.hyperLinkDelegate = self;
    
    [self.view addSubview:webView1];
    [self.view addSubview:webView2];

}

- (void) pushViewController:(UIViewController *)viewController withAnimate:(BOOL)animate {
    [self.navigationController pushViewController:viewController animated:animate];
}

@end
