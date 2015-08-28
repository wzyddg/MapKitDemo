//
//  MyCarViewController.m
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/28.
//  Copyright (c) 2015年 王 泽宇. All rights reserved.
//

#import "MyCarViewController.h"

@interface MyCarViewController (){
}

@end

@implementation MyCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadImage];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    if(!picked)
//    [self selectPhoto];
}

- (IBAction)takeImage:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)deleteImage:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"MKDCarImage"];
    [self reloadImage];
}


#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    [[NSUserDefaults standardUserDefaults] setObject:chosenImage forKey:@"MKDCarImage"];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self reloadImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)reloadImage{
    UIImage *carImage = [[NSUserDefaults standardUserDefaults] objectForKey:@"MKDCarImage"];
    self.imageView.image=carImage;
    if(carImage==nil){
        self.imageConditionLabel.text=@"暂无车辆";
        self.deleteImageButton.enabled=NO;
    }else{
        self.imageConditionLabel.text=@"";
        self.deleteImageButton.enabled=YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
