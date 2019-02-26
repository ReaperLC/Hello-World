//
//  Person.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "Person.h"
#import "RTCrashHelper.h"
#import <objc/runtime.h>
@interface Person()
@property (nonatomic, copy) NSString *school;//私有变量
@end

@implementation Person



-(instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Tom";
        self.sex = @"man";
        self.school = @"Harvard University";
    }
    return self;
}

#pragma mark - 归档解档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    /**
     传统做法:挨个属性去归档
     但是当遇到n多属性的时候 显然一个个去归档就很繁琐了
     */
    //    [aCoder encodeObject:self.name forKey:@"name"];
    //    [aCoder encodeObject:self.sex forKey:@"sex"];
    //    [aCoder encodeObject:self.friends forKey:@"friends"];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivarList[i];                     // 从成员列表中取出成员变量
        const char *name = ivar_getName(ivar);       // 获取成员变量名
        // 进行归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        //打印成员变量
//        NSLog(@"key-%@ value-%@",key,value);
        
        [aCoder encodeObject:value forKey:key];
    }
    //释放
    free(ivarList);
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        
        //        _name = [aDecoder decodeObjectForKey:@"name"];
        //        _sex = [aDecoder decodeObjectForKey:@"sex"];
        //        _friends = [aDecoder decodeObjectForKey:@"friends"];
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivarList[i]; // 从成员列表中取出成员变量
            const char *name = ivar_getName(ivar); // 获取成员变量名
            // 进行解档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            //打印成员变量
//            NSLog(@"key-%@ value-%@",key,value);
            // 将值赋值给成员变量
            [self setValue:value forKey:key];
        }
        //释放
        free(ivarList);
    }
    return self;
}

-(void)eat {
    NSLog(@"eat");
}

#pragma mark - 消息转发机制
/**
 动态方法解析
 对象：在接受到无法解读的消息的时候 首先会调用所属类的类方法
 
 @param sel 传递进入的方法
 @return 如果YES则能接受消息 NO不能接受消息 进入第二步
 */
+(BOOL)resolveInstanceMethod:(SEL)sel{
//    NSString *methodName = NSStringFromSelector(sel);
//    if ([methodName isEqualToString:@"Run"]) {
//        //对目标添加方法
//        class_addMethod([self class], sel,(IMP)addMethod, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

#pragma mark - 消息机制的第二步 消息转发机制
/**
 快速消息转发
 转发SEL去对象内部的其他可以响应的对象
 
 @param aSelector 需要被响应的方法SEL
 @return 返回一个可以被响应的该SEL的对象 如果返回self或者nil,则说明没有可以响应的目标 则进入第三步
 */

-(id)forwardingTargetForSelector:(SEL)aSelector{
//    NSString *methodName = NSStringFromSelector(aSelector);
//    if ([methodName isEqualToString:@"Run"]) {
//        //找备胎去处理
//        return [RTCrashHelper new];
//    }
    return [super forwardingTargetForSelector:aSelector];
}


//返回签名信息
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    NSString *methodName = NSStringFromSelector(aSelector);
//    if ([methodName isEqualToString:@"Run"]) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    }
    return [super methodSignatureForSelector:aSelector];
}

#pragma mark - 消息机制的第三步 完整的消息转发机制
//消息中转中心
-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    SEL sel = anInvocation.selector;
//    RTCrashHelper *hp = [[RTCrashHelper alloc] init];
//    if ([hp respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:hp];
//    }else{
       [super forwardInvocation:anInvocation];
//    }
}


//每一个C方法都包含两个隐式参数 1、方法调用者 2、方法编号
void addMethod(id self, SEL _cmd) {
    NSLog(@"\n*****CrashProtector: unrecognized selector sent to class*******\n方法名: %@\n类名: %@\n***************************************************************", NSStringFromSelector(_cmd),NSStringFromClass([self class]));
}


@end
