//
//  NSObject+CrashHandle.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/9.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "NSObject+CrashHandle.h"
#import <objc/runtime.h>
@implementation NSObject (CrashHandle)
//这个警告不仅仅是重写了系统的方法,在类别中重写了类的方法也会出现这个警告。
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"方法未实现 崩溃方法名:%@ %@",NSStringFromSelector(anInvocation.selector),anInvocation.target);
}
#pragma clang diagnostic pop
@end
