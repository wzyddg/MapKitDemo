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
- (IBAction)logout:(id)sender {
    self.userNameLabel.text=@"未登录";
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDUserID"];
    self.logoutButton.enabled=NO;
}

- (IBAction)goToLogin:(id)sender {
    NSLog(@"malamala");
    LoginViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self.navigationController pushViewController:lvc animated:YES];
}

@end
