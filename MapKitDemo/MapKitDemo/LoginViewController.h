//
//  LoginViewController.h
//  MapKitDemo
//
//  Created by wzy on 15/8/17.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKDModel.h"

@interface LoginViewController : UIViewController<InfoDealDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic,weak) UIButton* preLoginButton;
@property (nonatomic,weak) UIButton* preLogoutButton;
@property (nonatomic,weak) UILabel* preUserNameLabel;

- (IBAction)backgroundTap:(UIControl *)sender;

@end
