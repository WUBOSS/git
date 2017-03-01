//
//  NSObject+MClass.m
//  NSObjectExtension
//
//  Created by zhanshu1 on 2017/2/28.
//  Copyright © 2017年 zhanshu1. All rights reserved.
//

#import "NSObject+MClass.h"
#import <objc/runtime.h>
#import "MFoundation.h"
@implementation NSObject (MClass)
+(void)m_enumerateClasses:(MClassesEnumeration)enumeration
{
    if(enumeration==nil)
    {
        return;
    }
    
    BOOL stop = NO;
    Class c = self;
    while (c && !stop) {
        enumeration(c,&stop);
        c = class_getSuperclass(c);
        
        if([MFoundation isClassFormFoundation:c])
            break;
    }
    
}
+(void)m_enumerateAllClasses:(MClassesEnumeration)enumeration
{
    if(enumeration==nil)
    {
        return;
    }
    
    BOOL stop = NO;
    Class c = self;
    while (c && !stop) {
        enumeration(c,&stop);
        c = class_getSuperclass(c);
        
    }

}
+(void)m_setupIgnoredPropertyName:(MIgnoredPropertyNames)ignoredPropertyNames
{
    //
}
@end
