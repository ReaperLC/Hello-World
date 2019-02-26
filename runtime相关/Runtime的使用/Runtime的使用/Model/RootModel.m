//
//  RootModel.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RootModel.h"
#import "MJExtension.h"
@implementation RootModel
////字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
+(NSDictionary *)mj_objectClassInArray{
    return @{@"books":@"Book"};
}
@end
