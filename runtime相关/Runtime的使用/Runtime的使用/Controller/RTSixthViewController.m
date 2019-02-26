//
//  RTSixthViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTSixthViewController.h"
#import "Person.h"
@interface RTSixthViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logView;
@end

@implementation RTSixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)archiveAction:(id)sender {
    Person *p1 = [[Person alloc] init];
    
    //归档
    NSString *path = [NSString stringWithFormat:@"%@/archive.plist",NSHomeDirectory()];
    [NSKeyedArchiver archiveRootObject:p1 toFile:path];
    
    self.logView.text = [NSString stringWithFormat:@"归档路径:%@",path];
    
}
- (IBAction)unArchiveAction:(id)sender {
    //归档
    NSString *path = [NSString stringWithFormat:@"%@/archive.plist",NSHomeDirectory()];
    //解档
    Person *p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    self.logView.text = [NSString stringWithFormat:@"解档路径:%@\n解档数据:\np2.name =%@\np2.sex = %@",path,p2.name,p2.sex];
}


@end
