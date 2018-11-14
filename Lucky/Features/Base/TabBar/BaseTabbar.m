//
//  BaseTabbar.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "BaseTabbar.h"

@implementation BaseTabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"plus_Last"] forState:UIControlStateNormal];
        btn.bounds = CGRectMake(0, 0, 64, 64);
        self.centerBtn = btn;
        [self addSubview:btn];
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    
    int index = 0;
    CGFloat wigth = self.bounds.size.width / self.tabbarCount;
    
    for (UIView* sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * wigth, self.bounds.origin.y, wigth, 49);
            
            index++;
            
            if (index == 2) {
                index++;
            }
        }
    }
}

//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) {
        // 转换坐标
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        // 判断点击的点是否在按钮区域内
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            //返回按钮
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

@end
