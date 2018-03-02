//
//  ViewController.m
//  block
//
//  Created by 刘灿 on 2018/3/2.
//  Copyright © 2018年 ReaperLC. All rights reserved.
//

/**
  block如何分类？其实blcok的分类主要是根据block的内存管理来说的，系统把Block分为3类：**NSGlobalBlock**，**NSStackBlock**, **NSMallocBlock**;

  * **NSGlobalBlock** ：位于内存全局区
  * **NSStackBlock**  ：位于内存栈区
  * **NSMallocBlock** ：位于内存堆区
*/

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy)void (^testBlock)(void);


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      //全局
//    [self globalBlock];
      //堆
//    [self mallocBlock];
      //栈
//    [self stackBlock];
      //引用
      [self blockAdmin];
}
/**
   全局blcok ，内存全局区
   未引用任何局部变量
 */

NSString *globalStr = @"全局block变量引用";

- (void)globalBlock {
    
    //1、未引用任何外部变量
    void (^globalBlockTest) (NSString *) = ^(NSString *global){
        
        NSLog(@"%@",global);
    };
    
    NSLog(@"%@",globalBlockTest);
    
    //引用全局变量
    
    void (^globalBlockTest1)(void) = ^(){
        
        NSLog(@"%@",globalStr);
    };
    
    NSLog(@"%@",globalBlockTest1);
    
    globalBlockTest1();
}


/**
   堆区 block , 引用局部变量的block
 */
- (void) mallocBlock {
    
    //局部变量
    NSString *mallocBlockStr = @"堆区block局部变量";
    
    void (^mallocBlock)(void) = ^(){
        NSLog(@"%@", mallocBlockStr);
    };
    
    NSLog(@"%@", mallocBlock);
    mallocBlock();
}


/**
 栈区block
 */
- (void)stackBlock
{  
    
    NSString *stackBlockStr = @"栈区block变量";
    
    void (^stackBlock)(void) = ^{
        
        NSLog(@"%@", stackBlockStr);
    };  
    
    NSLog(@"block is %@", ^{  
        
        NSLog(@"%@", stackBlockStr);
        
    });  
  
    //打印可看出block是一个 NSStackBlock, 即在栈上, 当函数返回时block将无效  
    
    NSLog(@"block is %@", stackBlock);
    
    //上面这句在非arc中打印是 NSStackBlock, 但是在arc中就是NSMallocBlock  
    
    //即在arc中默认会将block从栈复制到堆上，而在非arc中，则需要手动copy.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"freedom");
}

#define TestClassExample3 1
-(void)blockAdmin
{
  
#if TestClassExample1
        
        //会引起循环应用，当前对象无法被释放
        self.testBlock = ^(){
            //增加自己本身的引用计数
            [self doSomething];
        };
        
#elif TestClassExample2
        
        //在非ARC下有效，防止循环引用
        //在ARC下无效，会产生循环引用
        __block ViewController *weakSelf = self;
        self.testBlock = ^(){
            
            //在非ARC下不会增加self的引用计数
            [weakSelf doSomething];
        };
        
#elif TestClassExample3
        
        //在非ARC下无效，会产生循环引用
        //在ARC下有效，防止循环应用
        __weak ViewController *weakSelf = self;
        self.testBlock = ^(){
            
            //在非ARC下不会增加self的引用计数
            [weakSelf doSomething];
        };
#endif
}

-(void)doSomething
{
    NSLog(@"测试程序");
}

@end
