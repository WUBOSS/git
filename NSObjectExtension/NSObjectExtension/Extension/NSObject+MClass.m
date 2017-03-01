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
#import "MDictionaryCache.h"
static const char MAllowedPropertyNamesKey = '\0';
static const char MIgnoredPropertyName ='\0';
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
+(void)m_setupAllowedPropertyNames:(MAllowedPropertyNames)allowedPropertyNames
{
    [self m_setupBlockReturnValue:allowedPropertyNames key:&MAllowedPropertyNamesKey];
    
}

+(void)m_setupIgnoredPropertyName:(MIgnoredPropertyNames)ignoredPropertyNames
{
    //
    [self m_setupBlockReturnValue:ignoredPropertyNames key:&MIgnoredPropertyName];
    
}
+(NSMutableArray *)m_totalAllowedPropertyNames
{
    return [self m_totalObjectsWithSelector:@selector(m_allowedPropertyNames) key:&MAllowedPropertyNamesKey];
}

+(NSMutableArray*)m_totalObjectsWithSelector:(SEL)selector key:(const char*)key
{
    NSMutableArray *array=[MDictionaryCache objectForKey:NSStringFromClass(self) forDictId:key];
    
    if(array) return array;
    [MDictionaryCache setObject:array = [NSMutableArray array] forkey:NSStringFromClass(self) forDictId:key];
    if([self respondsToSelector:selector])
    {
        NSArray *subArray=[self performSelector:selector];
        if(subArray)
        {
            [array addObjectsFromArray:subArray];
        }
    }
    
    [self m_enumerateAllClasses:^(__unsafe_unretained Class c, BOOL *stop) {
        NSArray *subArray=objc_getAssociatedObject(c, key);
        [array addObjectsFromArray:subArray];
        
    }];
    return array;
    
}
+(void)m_setupBlockReturnValue:(id(^)())block key:(const char *)key
{
    if(block)
    {
        objc_setAssociatedObject(self, key, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }else
    {
        
        objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}
@end
