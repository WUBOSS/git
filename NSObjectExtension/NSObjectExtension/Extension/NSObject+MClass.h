//
//  NSObject+MClass.h
//  NSObjectExtension
//
//  Created by zhanshu1 on 2017/2/28.
//  Copyright © 2017年 zhanshu1. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MClassesEnumeration)(Class c,BOOL *stop);
typedef NSArray* (^MAllowedPropertyNames)();
typedef NSArray* (^MAllowedCodingPropertyNames)();
typedef NSArray* (^MIgnoredPropertyNames)();
typedef NSArray* (^MIgnoredCodingPropertyNames)();

@interface NSObject (MClass)

@end
