//
//  ViewController.m
//  自动归解档
//
//  Created by 刘灿 on 2018/5/10.
//  Copyright © 2018年 ReaperLC. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [Person new];
    p.name = @"LC";
    p.age = @27;
    p.nick = @"Reaper";
    //归档
    NSString *path = [NSString stringWithFormat:@"%@/archive.plist",NSHomeDirectory()];
    [NSKeyedArchiver archiveRootObject:p toFile:path];
    
    //解档
    Person *p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@ ,%@,%@",p1.name,p1.age,p.nick);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
