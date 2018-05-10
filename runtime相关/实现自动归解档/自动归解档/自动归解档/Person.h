/**
 * 作者：刘灿
 * 创建时间：2018/5/10 21:40
 * 版本：[1.0, 2018/5/10]
 * 版权：LC
 * 描述：自动归解档
 */

#import <Foundation/Foundation.h>
///自动化归解档  实现NSCoding协议
@interface Person : NSObject <NSCoding>
/** 姓名 */
@property (nonatomic, copy) NSString  *name;
/** 年龄 */
@property (nonatomic, strong) NSNumber  *age;
/** 外号 */
@property (nonatomic, copy) NSString  *nick;
@end
