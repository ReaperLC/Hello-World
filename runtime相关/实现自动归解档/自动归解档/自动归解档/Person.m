//
//  Person.m
//  自动归解档
//
//  Created by 刘灿 on 2018/5/10.
//Copyright © 2018年 ReaperLC. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>   ///运行时
@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count = 0;
    //取属性
    objc_property_t *propertes = class_copyPropertyList([self class], &count);
    //遍历属性
    for (int i = 0; i < count; i ++ ) {
        //获取属性名称
        const char *propertyName = property_getName(propertes[i]);
        //转OC字符串
        NSString *name = [NSString stringWithUTF8String:propertyName];
        //KVC 取值
        id value = [self valueForKey:name];
        //归档
        [aCoder encodeObject:value forKey:name];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if (self) {
        unsigned int count = 0;
        //取属性
        objc_property_t *propertes = class_copyPropertyList([self class], &count);
        //遍历属性
        for (int i = 0; i < count; i ++ ) {
            //获取属性名称
            const char *propertyName = property_getName(propertes[i]);
            //转OC字符串
            NSString *name = [NSString stringWithUTF8String:propertyName];
            //KVC 取值
            id value = [aDecoder decodeObjectForKey:name];
            //解档
            [self setValue:value forKey:name];
        }
        
    }
    return self;
}
@end
