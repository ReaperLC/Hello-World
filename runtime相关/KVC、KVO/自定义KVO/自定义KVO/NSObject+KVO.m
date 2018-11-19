//
//  NSObject+KVO.m
//  自定义KVO
//
//  Created by 刘灿 on 2018/5/10.
//  Copyright © 2018年 ReaperLC. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
@implementation NSObject (KVO)
//-(void)lc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
//    ///创建并注册一个类
//    NSString *oldName =NSStringFromClass([self class]);
//    NSString *newName = [NSString stringWithFormat:@"CustomKVO_%@",oldName];
//    
//    Class CustomClass = objc_allocateClassPair([self class], newName.UTF8String, 0);
//    ///修改self类型
//    object_setClass(self, CustomClass);
//    ///重写setName方法
//    
//    NSString *methodName = [NSString stringWithFormat:@"set%@:",keyPath.capitalizedString];
//    
//    SEL sel =NSSelectorFromString(methodName);
//    
//    class_addMethod(CustomClass, self, IMP()setterMethodIMP,"v@:@");
//}

void setterMethodIMP(id self,SEL _cmd,id newValue){
    
}
///改变父类的属性值

///
@end
