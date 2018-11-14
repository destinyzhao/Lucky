//
//  MBProgressHUD+Expand.h
//  SurveyManagement
//
//  Created by Destiny on 2018/6/21.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Expand)

/**
 在Widow上显示

 @param message 提示信息
 */
+ (void)showTipMessageInWindow:(NSString*)message;

/**
 在View上显示
 
 @param message 提示信息
 */
+ (void)showTipMessageInView:(NSString*)message;

+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer;


+ (void)showActivityMessageInWindow:(NSString*)message;
+ (void)showActivityMessageInView:(NSString*)message;
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer;


+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;

+ (void)hideHUD:(BOOL)isWindow;

@end
