//
//  Person+AddProperty.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "Person+AddProperty.h"
//重写get和set方法
@implementation Person (AddProperty)
-(NSString *)mobile {
    return objc_getAssociatedObject(self, "mobile");
}

-(void)setMobile:(NSString *)mobile {
    objc_setAssociatedObject(self, "mobile", mobile, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
