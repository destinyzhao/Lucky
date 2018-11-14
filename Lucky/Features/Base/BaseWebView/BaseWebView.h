//
//  BaseWebView.h
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebView : WKWebView

@property (strong, nonatomic) UIProgressView *progressView;

@end

NS_ASSUME_NONNULL_END
