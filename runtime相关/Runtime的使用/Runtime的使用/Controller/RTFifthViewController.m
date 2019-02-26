//
//  RTFifthViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTFifthViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface RTFifthViewController (){
    
}
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation RTFifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 "v@:" 意思是，v 代表无返回值 void，如果是 i 则代表 int；@代表 id sel; : 代表 SEL _cmd;
 “v@:@@” 意思是，两个参数的没有返回值。
 */
- (IBAction)addMethodForPerson:(id)sender {
    SEL getUserInfoSel = sel_registerName("getUserInfo");
    
    /**
     动态添加方法

     cls类型
     name :SEL 方法编号
     IMP 方法实现(函数指针)
     types:返回值 &参数类型
     */
    BOOL isAdd =  class_addMethod([Person class], getUserInfoSel, (IMP)getUserInfo,"v@:@@");
    self.logView.text = [NSString stringWithFormat:@"方法添加: %@",isAdd?@"成功":@"失败"];
}
- (IBAction)getPerson:(id)sender {
    Person *p = [Person new];
    SEL getUserInfoSel = sel_registerName("getUserInfo");
    if ([p respondsToSelector:getUserInfoSel]) {
        getUserInfo(p,self);
    }
}
void getUserInfo(id person,id obj){
    RTFifthViewController *vc =(RTFifthViewController *)obj;
    vc.logView.text = [NSString stringWithFormat:@"添加的方法，获取全部信息:\np.name=%@\np.sex=%@",((Person *)person).name,((Person *)person).sex];
}


@end
