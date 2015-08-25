//
//  LoginViewController.m
//  MapKitDemo
//
//  Created by wzy on 15/8/17.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController{
    MKDModel* _mkdmodel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIBarButtonItem* uibbi = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    _mkdmodel = [[MKDModel alloc]initWithDelegate:self];
//    self.navigationItem.leftBarButtonItem=uibbi;
    self.navigationItem.title=@"登录";
    self.passwordField.secureTextEntry=YES;
    // Do any additional setup after loading the view.
}

-(void)dealInfo:(NSString *)info{
    NSArray* userInfos = [info componentsSeparatedByString:@","];
    NSString * userName = [userInfos objectAtIndex:0];
    NSString * userID = [userInfos objectAtIndex:1];
    NSNumber * userIDInt = [NSNumber numberWithInteger:[userID intValue]];
    
    if([userName isEqualToString:@"null"]||[userID isEqualToString:@"0"]){
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDUserID"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDUserName"];
        UIAlertView * failUIAV = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"登录失败！用户名或密码错误！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [failUIAV show];
        self.preUserNameLabel.text=@"未登录";
        self.preLogoutButton.enabled=NO;
        self.preLoginButton.enabled = YES;
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:userIDInt forKey:@"MKDUserID"];
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"MKDUserName"];
        UIAlertView * sucUIAV = [[UIAlertView alloc]initWithTitle:@"登录成功" message:@"登录成功，您现在可以使用本产品!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [sucUIAV show];
        self.preUserNameLabel.text=userName;
        self.preLogoutButton.enabled=YES;
        self.preLoginButton.enabled = NO;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self goBack];
}

-(void)goBack{
//    NSLog(@"egeg");
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)backgroundTap:(id)sender
{
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}
- (IBAction)login:(id)sender {
    NSString* userName = self.userNameField.text;
    NSString* password = self.passwordField.text;
    //add some security code
//    NSLog(@"%@%@",userName,password);
    [_mkdmodel loginWithUserName:userName andPassword:password];
}

@end
