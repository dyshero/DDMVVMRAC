//
//  ViewController.m
//  MVVMDemo
//
//  Created by duodian on 2017/6/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[_nameText rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x) {
        UITextField *textField = (UITextField *)x;
        NSLog(@"%@",textField.text);
    }];
}


- (IBAction)clicked:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"RAC Test" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other",@"",@""];
    
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"%@",tuple.first);
    }];
}


@end
