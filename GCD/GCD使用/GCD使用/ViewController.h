//
//  ViewController.h
//  GCD使用
//
//  Created by 刘灿 on 2018/10/25.
//  Copyright © 2018年 刘灿. All rights reserved.
//

/**
 
 串行 (DISPATCH_QUEUE_SERIAL)
 并发 (DISPATCH_QUEUE_CONCURRENT)
 
  --------------------------------------------------------------------
 |     区别      |        并发队列          |           串行队列          |
  --------------------------------------------------------------------|
 |              |                         |                           |
 |     同步      |  没开启新线程，串行执行     |    没开启新线程，串行执行     |
 |              |                         |                           |
  --------------------------------------------------------------------|
 |              |                         |                           |
 |      异步     |   开启新线程，并发执行      |    开启一条新线程，串行执行   |
 |              |                         |                           |
  --------------------------------------------------------------------
 
 特殊情况：
 
 1、同步执行 + 主队列   主线程调用：死锁卡住不执行 其他线程调用：没有开启新线程，串行执行任务
 2、异步执行 + 主队列   没开启新线程，串行执行
 
 其他：
 
 1、栅栏      dispatch_barrier_async
 2、延时      dispatch_after
 3、一次      dispatch_once  （单例）
 4、对列组    dispatch_group
 5、监听      dispatch_group_notify
 6、阻塞线程  dispatch_group_wait
 
 
 
 创建： dispatch_queue_create("com.leocy.gcd", DISPATCH_QUEUE_SERIAL);
 参数1: 标识线程，一般反向域名即可
 参数2: 当前队列类型  串行SERIAL or 并发 CONCURRENT
 
 
 
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

