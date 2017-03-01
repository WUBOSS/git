//
//  MDictionaryCache.h
//  NSObjectExtension
//
//  Created by zhanshu1 on 2017/3/1.
//  Copyright © 2017年 zhanshu1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDictionaryCache : NSObject
+(id)setObject:(id)object forkey:(id<NSCopying>)key forDictId:(const void *)dictId;
+(id)objectForKey:(id<NSCopying>)key forDictId:(const void *)dictId;
+(id)dictWithDictId:(const void *)dictId;
@end
