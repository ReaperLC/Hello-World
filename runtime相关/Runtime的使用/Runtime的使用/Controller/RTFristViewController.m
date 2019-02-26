//
//  RTFristViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTFristViewController.h"
#import <objc/message.h>
#import "Person.h"
@interface RTFristViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation RTFristViewController
-(NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dic = @{@"array":[[NSMutableArray alloc] init]};
    [self.array addObject:dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    NSLog(@"111");
}
@end
