//
//  RTFourthViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTFourthViewController.h"
#import "UIButton+NSLog.h"
@interface RTFourthViewController ()

@end

@implementation RTFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 240, 50)];
    button.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 200);
    button.backgroundColor = [UIColor orangeColor];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:@"测试按钮1" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton *btn  = [[UIButton alloc] init];
//    btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 200);
//    btn.backgroundColor = [UIColor greenColor];
//    btn.titleLabel.font = [UIFont systemFontOfSize:17];
//    [btn setTitle:@"测试按钮2" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(buttonClicked1:) forControlEvents:UIControlEventTouchUpInside];
    self.testbtn = btn;
    [self.view addSubview:self.testbtn];
    
    
}
- (void)buttonClicked1:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonClicked:(UIButton *)sender{
    NSLog(@"点击代码创建的按钮");
}
- (IBAction)XibBtnClick:(id)sender {
    NSLog(@"点击xib创建的按钮");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.testbtn removeFromSuperview];
    NSLog(@"123123");
}
@end
