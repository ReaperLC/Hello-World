//
//  RTThirdViewController.m
//  Runtime的使用
//
//  Created by 刘灿 on 2019/1/8.
//  Copyright © 2019 刘灿. All rights reserved.
//

#import "RTThirdViewController.h"
#import "Person.h"
#import "Person+AddProperty.h"
@interface RTThirdViewController ()
{
    Person *p;
}
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation RTThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getPerson:(id)sender {
    p = [[Person alloc] init];
    
    self.logView.text = [NSString stringWithFormat:@"p.name = %@\np.sex=%@",p.name,p.sex];
}

- (IBAction)addMibileForPerson:(id)sender {
    
    p.mobile = @"16606120045";
    
    self.logView.text = [NSString stringWithFormat:@"p.name = %@\np.sex=%@\np.mobile=%@",p.name,p.sex,p.mobile];
}

@end
