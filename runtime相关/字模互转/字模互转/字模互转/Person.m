//
//  Person.m
//  字模互转
//
//  Created by 刘灿 on 2018/5/10.
//Copyright © 2018年 ReaperLC. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
+(instancetype)lc_initWithDict:(NSDictionary *)dic{
    
    id myObj = [[self alloc] init];
    
    unsigned int outCount;
    
    //获取类中的所有成员属性
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        
        //获取属性名字符串
        //model中的属性名
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id propertyValue = dic[propertyName];
        
        if (propertyValue != nil) {
            [myObj setValue:propertyValue forKey:propertyName];
        }
    }
    
    free(properties);
    
    return myObj;
}
@end
