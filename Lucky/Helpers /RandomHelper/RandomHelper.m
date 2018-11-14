//
//  RandomHelper.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "RandomHelper.h"

@implementation RandomHelper

/**
 获取一个随机整数,范围在[from,to),包括from,包括to
 
 @param from 开始范围
 @param to 结束范围
 @return 随机数
 */
+(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

@end
