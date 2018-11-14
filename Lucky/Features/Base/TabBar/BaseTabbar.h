//
//  BaseTabbar.h
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabbar : UITabBar
/**Tabbar Item 中间凸起按钮*/
@property (nonatomic, strong) UIButton *centerBtn;
/**Tabbar Item 总数*/
@property (nonatomic, assign) NSInteger tabbarCount;

@end

NS_ASSUME_NONNULL_END
