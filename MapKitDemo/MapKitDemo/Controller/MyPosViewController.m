//
//  MyPosViewController.m
//  MapKitDemo
//
//  Created by wzy on 15/8/15.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "MyPosViewController.h"

#import "MKDModel.h"

@interface MyPosViewController ()

@end

@implementation MyPosViewController{
    MKDModel * _mkdModel;
    CLLocation * location;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect innerSize=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mapView=[[MAMapView alloc] initWithFrame:innerSize];
    self.mapView.delegate = self;
    self.mapView.showsScale= NO;
    self.mapView.showsCompass= YES;
    self.mapView.showTraffic = NO;
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    _mkdModel = [[MKDModel alloc]initWithDelegate:self];
    location=nil;
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.sendButton];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPos:(id)sender {
    NSNumber* userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"MKDUserID"];
    if(userID==nil||userID.intValue<1){
        UIAlertView * nullUserUIAV = [[UIAlertView alloc]initWithTitle:@"请登录" message:@"请个人信息登录后使用本功能！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [nullUserUIAV show];
        return;
    }
    if(location==nil){
        NSLog(@"location is null");
        UIAlertView * nullLoactionUIAV = [[UIAlertView alloc]initWithTitle:@"未获取到位置" message:@"暂未获取到您的位置。请连接网络并允许本应用使用位置" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [nullLoactionUIAV show];
        return;
    }else{
        NSLog(@"%f|||%f",location.coordinate.latitude,location.coordinate.longitude);
    }
    //userID and location got
    [_mkdModel sendUserLocationWithUserID:userID.intValue AndUserLocation:location];
}

-(void)dealInfo:(NSString *)info{
    NSLog(@"%@",info);
    if([info isEqualToString:@"sendOK"])
    {
        UIAlertView * sendOKUIAV = [[UIAlertView alloc]initWithTitle:@"发送成功" message:@"发送位置成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [sendOKUIAV show];
    }else{
        UIAlertView * sendFailUIAV = [[UIAlertView alloc]initWithTitle:@"发送失败" message:@"发送失败，请重新登录或联系服务提供商。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [sendFailUIAV show];
    }
    return;
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    location=userLocation.location;
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
