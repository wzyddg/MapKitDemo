//
//  LoginViewController.m
//  MapKitDemo
//
//  Created by wzy on 15/8/17.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem* uibbi = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];

    self.navigationItem.leftBarButtonItem=uibbi;
    self.navigationItem.title=@"登录";
    // Do any additional setup after loading the view.
}

-(void)goBack{
//    NSLog(@"egeg");
    [self.navigationController popViewControllerAnimated:YES];
}

@end
