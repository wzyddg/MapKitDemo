//
//  MyCarViewController.h
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/28.
//  Copyright (c) 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCarViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageConditionLabel;
@property (weak, nonatomic) IBOutlet UIButton *takeImageButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteImageButton;

@end
