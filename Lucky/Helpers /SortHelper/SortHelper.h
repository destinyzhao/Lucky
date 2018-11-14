//
//  SortHelper.h
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortHelper : NSObject

/**
 数组排序
 
 @param arr 排序前数组
 @return 排序后数组
 */
+ (NSArray *)sortArray:(NSMutableArray *)arr;

@end

NS_ASSUME_NONNULL_END
