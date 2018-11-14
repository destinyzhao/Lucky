//
//  BaseWebView.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "BaseWebView.h"

@implementation BaseWebView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 1, CGRectGetWidth(self.frame),1)];
        [_progressView setTrackTintColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.8]]; // 背景色
        [_progressView setTintColor:[[UIColor blueColor]colorWithAlphaComponent:0.6]]; // 进度条
        
        [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld context:nil];
        
    }
    return _progressView;
}

#pragma mark - 初始化 ProgressView
- (void)setupProgressView
{
    [self addSubview:self.progressView];
}

- (void)layoutSubviews
{
    [self setupProgressView];
}

#pragma mark - 监听webView加载进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqual: @"estimatedProgress"] && object == self) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.estimatedProgress animated:YES];
        if(self.estimatedProgress >= 1.0f)
        {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}


@end
