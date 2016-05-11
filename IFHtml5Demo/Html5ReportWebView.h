//
//  Html5ReportWebView.h
//  IFHtml5Demo
//
//  Created by WeiYanglu on 16/5/11.
//  Copyright © 2016年 WeiYanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebViewHyperLinkDelegate

/**
 *  需要打开新视图的超链
 *  @param viewController 需要新打开的视图
 *  @param animate 是否有动画
 */
- (void) pushViewController:(UIViewController *)viewController withAnimate:(BOOL) animate;

@end

@interface Html5ReportWebView : UIWebView

- (id) initWithFrame:(CGRect)frame andUrl:(NSString *) url;

@property (nonatomic, weak) id<WebViewHyperLinkDelegate> hyperLinkDelegate;

@end
