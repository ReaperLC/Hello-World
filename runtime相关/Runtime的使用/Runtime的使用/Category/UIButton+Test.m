//
//  UIButton+Test.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/10.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "UIButton+Test.h"
#import <objc/runtime.h>
@implementation UIButton (Test)
+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        **获取方法名**
        SEL origSel = @selector(sendAction:to:forEvent:);
        SEL swizSel = @selector(test_sendAction:to:forEvent:);
        Method origMethod = class_getInstanceMethod([self class], origSel);
        Method swizMethod = class_getInstanceMethod([self class], swizSel);
        //        ** 判断方法是否添加成功 **
        BOOL addMethod = class_addMethod([self class], origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
        if (addMethod) {
            //            **替换类中已有方法的实现,如果该方法不存在添加该方法 **
            class_replaceMethod([self class], swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
        }else{
            //            **替换Method**
            method_exchangeImplementations(origMethod, swizMethod);
        }
    });
}
-(void)test_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
     NSLog(@"22222");
//    [self test_sendAction:action to:target forEvent:event];
}
@end
