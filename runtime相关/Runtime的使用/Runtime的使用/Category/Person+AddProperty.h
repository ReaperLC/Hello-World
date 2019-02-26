//
//  Person+AddProperty.h
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//  动态添加属性

#import "Person.h"
#import <objc/runtime.h>
@interface Person (AddProperty)
@property (nonatomic, copy) NSString *mobile;
@end
