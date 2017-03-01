//
//  MDictionaryCache.m
//  NSObjectExtension
//
//  Created by zhanshu1 on 2017/3/1.
//  Copyright © 2017年 zhanshu1. All rights reserved.
//

#import "MDictionaryCache.h"
#import <objc/runtime.h>
@implementation MDictionaryCache
+(id)setObject:(id)object forkey:(id<NSCopying>)key forDictId:(const void *)dictId
{
    NSMutableDictionary *dict=[self dictWithDictId:dictId];
    if(dict==nil)
    {
        dict=[NSMutableDictionary dictionary];
        
        objc_setAssociatedObject(self, dictId, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    dict[key]=object;
    return dict;
}
+(id)dictWithDictId:(const void *)dictId
{
    return objc_getAssociatedObject(self, dictId);
}
+(id)objectForKey:(id<NSCopying>)key forDictId:(const void *)dictId
{
    return [self dictWithDictId:dictId][key];
}
@end
