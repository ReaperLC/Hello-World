//
//  Person.h
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
/** 姓名 */
@property (nonatomic, copy) NSString *name;
/** 性别 */
@property (nonatomic, copy) NSString *sex;

- (void)eat;

@end
