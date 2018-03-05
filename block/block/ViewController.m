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
//      [self blockAdmin];
    //block的使用
    [self userForBlock];
}


#pragma mark - Block的分类
/**
   全局blcok ，内存全局区
   未引用任何局部变量
   在声明Block之后、调用Block之前对全局变量进行修改,在调用Block时全局变量值是修改之后的新值
   在Block中可以直接修改 全局变量  （静态变量 同全局变量）
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
   1、在声明Block之后、调用Block之前对局部变量进行修改,在调用Block时局部变量值是修改之前的旧值
   2、在局部变量前使用__block修饰,在声明Block之后、调用Block之前对局部变量进行修改,在调用Block
      时局部变量值是修改之后的新值
   3、block中不能直接使用修改局部变量 若要修改 需要用 __block对局部变量进行修饰
 */
- (void) mallocBlock {
    
    //局部变量
    __block  NSString *mallocBlockStr = @"堆区block局部变量";
    
    void (^mallocBlock)(void) = ^(){
        mallocBlockStr = @"此时是对的"; //此举正确 如果去掉 __block修饰此处理应报错
        NSLog(@"%@", mallocBlockStr);
    };
    //申明后 、调用前修改局部变量,  实则使用的还是之前的变量值
    //如果想使用修改后的变量值，需要用 __block对局部变量进行修饰即可
//    mallocBlockStr = @"修改了没？";
    
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



#pragma mark - Block的使用
- (void)userForBlock {
    /**
     *  注: ^被称作"脱字符"
     *  Block变量的声明格式为: 返回值类型(^Block名字)(参数列表);
     *  形参变量名称可以省略,只留有变量类型即可
     *  void(^aBlock)(NSString *, NSString *);
     */
    
    //声明 (无返回参数)
    void(^aBlock)(NSString *x, NSString *y);
    //赋值
    aBlock = ^ (NSString *str1 ,NSString *str2){
        NSLog(@"%@ %@",str1,str2);
    };
    //调用
    aBlock(@"Do You Like This?" ,@"YES,I Do!");
    
    /**
     *  注: Block变量的赋值格式可以是: Block变量 = ^返回值类型(参数列表){函数体};
     不过通常情况下都将返回值类型省略,因为编译器可以从存储代码块的变量中确定返回值的类型
     *  RLBlock rlblock = ^(NSString *str){};
     *  Block变量的赋值格式为: Block变量 = ^(参数列表){函数体};
     */
    
    //声明的同时进行赋值  申明 + 赋值
    int(^myBlock)(int) = ^(int num){
        return num * 7;
    };
    //调用
    NSLog(@"计算结果 ： %d",myBlock(6));
    
    
    
    //如果没有参数列表,在赋值时参数列表可以省略  申明 + 赋值
    void(^aVoidBlock)(void) = ^{
        NSLog(@"I am a aVoidBlock");
    };
    //调用
    aVoidBlock();
    
    
    /**
     在实际使用Block的过程中,我们可能需要重复地声明多个相同返回值相同参数列表的Block变量,
     如果总是重复地编写一长串代码来声明变量会非常繁琐,所以我们可以使用typedef来定义Block类型
     */
    
    //声明
    typedef void(^RLBlock)(NSString *str);
    //赋值
    RLBlock rlblock = ^(NSString *str){
        NSLog(@"%@",str);
    };
    //调用
    rlblock(@"Just Try For It!");
    
    
    /**
     Block作为参数传递
     1、作为C的参数
     2、作为OC的参数
     */
    
    //作为C的参数
    
    
    
//    // 2.声明并赋值定义一个Block变量
//    int(^addBlock)(int, int) = ^(int x, int y){
//        return x+y;
//    };
//
//    // 3.以Block作为函数参数,把Block像对象一样传递
//    aBlockForC(addBlock);
    
    // 将第2点和第3点合并一起,以内联定义的Block作为函数参数
    aBlockForC(^(int x, int y) {
        return x+y;
    });
    
    
    //block for OC
    
    [self aBlockForOC:^int(int x , int y) {
        return x + y;
    }];
    
}
#pragma mark - 1.定义一个形参为Block的C函数

void aBlockForC(int(^aBlock)(int, int))
{
    NSLog(@"Block For C result  = %d", aBlock(300,200));
}

#pragma mark - 2、定义一个形参为Block的 OC 函数
#pragma mark 使用typedef简化block
typedef int (^addBlock)(int,int);

-(void)aBlockForOC:(addBlock)aBlock {
    NSLog(@"Block For OC result = %d", aBlock(400,200));
}
//-(void)aBlockForOC:(int(^)(int, int))aBlock {
//     NSLog(@"Block For OC result = %d", aBlock(400,200));
//}










@end
