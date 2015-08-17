//
//  UserStatusViewController.m
//  MapKitDemo
//
//  Created by wzy on 15/8/16.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "UserStatusViewController.h"
#import "LoginViewController.h"

@implementation UserStatusViewController
-(void)viewDidLoad{
    NSString *userName= [[NSUserDefaults standardUserDefaults] objectForKey:@"MKDUserName"];
    if(userName==nil){
        userName=@"未登录";
        self.logoutButton.enabled=NO;
        self.loginButton.enabled=YES;
    }else{
        self.logoutButton.enabled=YES;
        self.loginButton.enabled = NO;
    }
    self.navigationItem.title=@"个人信息";
    self.userNameLabel.text=userName;
}

- (IBAction)logout:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDUserID"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDUserName"];
    
    UIAlertView * outUIAV = [[UIAlertView alloc]initWithTitle:@"注销" message:@"已经成功注销" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [outUIAV show];
    self.userNameLabel.text=@"未登录";
//    self.loginButton.enabled=YES;
//    self.logoutButton.enabled=NO;
    //maybe tell the server
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.userNameLabel.text=@"未登录";
    self.loginButton.enabled=YES;
    self.logoutButton.enabled=NO;
}

- (IBAction)goToLogin:(id)sender {
    LoginViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    lvc.preLoginButton=self.loginButton;
    lvc.preLogoutButton=self.logoutButton;
    lvc.preUserNameLabel=self.userNameLabel;
    [self.navigationController pushViewController:lvc animated:YES];
}

@end
