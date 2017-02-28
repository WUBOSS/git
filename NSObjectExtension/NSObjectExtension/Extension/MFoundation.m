//
//  MFoundation.m
//  NSObjectExtension
//
//  Created by zhanshu1 on 2017/2/28.
//  Copyright © 2017年 zhanshu1. All rights reserved.
//

#import "MFoundation.h"
#import <CoreData/CoreData.h>
static NSSet *foundationClasses_;
@implementation MFoundation
+(NSSet *)foundationClasses
{
    if(foundationClasses_==nil)
    {
        foundationClasses_=[NSSet setWithObjects:[NSURL class],[NSDate class],[NSValue class],[NSData class],[NSError class],[NSArray class],[NSDictionary class],[NSString class], [NSAttributedString class],nil];
    }
    
    return foundationClasses_;
}
+(BOOL)isClassFormFoundation:(Class)c
{
    if (c==[NSObject class]||c==[NSManagedObject class])
    {
        return YES;
    }
    
    __block BOOL result=NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        if([c isSubclassOfClass:obj])
        {
            result=YES;
            *stop=YES;
        }
    }];
    
    return result;
    
}
@end
