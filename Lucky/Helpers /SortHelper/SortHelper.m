//
//  SortHelper.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "SortHelper.h"

@implementation SortHelper

/**
 数组排序
 
 @param arr 排序前数组
 @return 排序后数组
 */
+ (NSArray *)sortArray:(NSMutableArray *)arr
{
    NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 intValue] < [obj2 intValue]) {
            return NSOrderedAscending;
        }
        else{
            return NSOrderedDescending;
        }
        
    }];
    return result;
    
}

@end
