//
//  ViewController.h
//  自动归解档
//
//  Created by 刘灿 on 2018/5/10.
//  Copyright © 2018年 ReaperLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
// 自动归解档要点

// 1 、遵循NSCoding协议
// 2 、实现NSCoding两个协议方法 - (void)encodeWithCoder:(NSCoder *)aCoder;
//                           - (nullable instancetype)initWithCoder:(NSCoder *)aDecoder; // NS_DESIGNATED_INITIALIZER

//3、 归档
/// 1)、获取属性列表 class_copyPropertyList   2)、遍历属性列表获取属性名   3)、KVC取值 valueForKey  4)、归档 encodeObject:forKey/

//4 、解档
/// 1)、获取属性列表 class_copyPropertyList   2)、遍历属性列表获取属性名   3)、解档 decodeObjectForKey 4)、取值 setValue:forKey
@end

