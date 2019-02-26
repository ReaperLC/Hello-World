//
//  RTSeventhViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTSeventhViewController.h"
#import "MJExtension.h"
#import "RootModel.h"
@interface RTSeventhViewController ()

@end

@implementation RTSeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    /** 使用MJExtension 是不是很方便? */
    RootModel *model = [RootModel mj_objectWithKeyValues:dict];
    NSLog(@"%@",model.author.name);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
