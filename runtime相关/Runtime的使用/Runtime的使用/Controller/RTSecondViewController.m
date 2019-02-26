//
//  RTSecondViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTSecondViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface RTSecondViewController (){
    Person *p;
}
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation RTSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logPerson:(id)sender {
    p = [Person new];

    self.logView.text = [NSString stringWithFormat:@"修改前为:\np.name = %@\np.sex=%@\np.school=%@",p.name,p.sex,[p valueForKey:@"school"]];
    
}
- (IBAction)modifyPerson:(id)sender {
    unsigned int count = 0;
    // 获取类的成员变量列表、方法(包括私有)，
    Ivar *varList = class_copyIvarList([Person class], &count);
    //    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = varList[i];
        const char *varName = ivar_getName(var);
        NSString *proname = [NSString stringWithUTF8String:varName];
        self.logView.text = [NSString stringWithFormat:@"查看成员变量: %@",proname];
        
        if ([proname isEqualToString:@"_school"]) {
            object_setIvar(p, var, @"清华大学");
//                        [p setValue:@"北京大学" forKey:@"school"];
        }
    }
    self.logView.text = [NSString stringWithFormat:@"修改后姓名为:\np.name = %@\np.sex=%@\np.school=%@",p.name,p.sex,[p valueForKey:@"school"]];
}

@end
