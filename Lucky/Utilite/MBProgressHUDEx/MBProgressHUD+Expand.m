//
//  MBProgressHUD+Expand.m
//  SurveyManagement
//
//  Created by Destiny on 2018/6/21.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "MBProgressHUD+Expand.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (Expand)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{

    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    
    [self hideHUDForView:view];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //设置等待框背景色为黑色
    hud.bezelView.backgroundColor = [UIColor blackColor];
    // 设置背景色
    hud.backgroundColor = [UIColor clearColor];
    //设置菊花框为白色
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    // 设置可点击其他操作
    hud.userInteractionEnabled= YES;
    hud.label.text = message?message:@"加载中.....";
    hud.label.textColor = [UIColor whiteColor];
    hud.label.font = [UIFont systemFontOfSize:13];
    hud.removeFromSuperViewOnHide = YES;

    return hud;
}

#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    [self showTipMessage:message isWindow:true timer:1];
}

+ (void)showTipMessageInView:(NSString*)message
{
    [self showTipMessage:message isWindow:false timer:1];
}

+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:true timer:aTimer];
}

+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:false timer:aTimer];
}

+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    hud.label.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:1];
}

#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message isWindow:true timer:0];
}

+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message isWindow:false timer:0];
}

+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}

+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}

+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    //设置菊花框为白色
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
}

#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    NSString *name =@"MBHUD_Success";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showErrorMessage:(NSString *)Message
{
    NSString *name =@"MBHUD_Error";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showInfoMessage:(NSString *)Message
{
    NSString *name =@"MBHUD_Info";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showWarnMessage:(NSString *)Message
{
    NSString *name =@"MBHUD_Warn";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
    
}

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:1];
    
}

+ (void)hideHUD:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    [self hideHUDForView:view];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    
    [self hideHUDForView:view animated:YES];
}


//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}

+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

@end
